void draw() {
  initialisation();
  println(manche);
  dessinPlateau();
  uneBouclePlayerTurn();
  //noLoop();
}

void setup() {
  size(1200, 400);
  coordCasePlateau();
}


//définition variable
int playerNumber = 3;
int[] coordCase;
int coordCaseY = 50;
int position = 0;
int manche = 0;
int lancerDeTour;
int joueurEnCours;
int[] turnHotelPlayer;
color[] playerColor;
int[] playerPos;
boolean[] stuckPuit;
boolean[] stuckPrison;
boolean initialisation = false;
int compteurBoucle = 0;


//dessine case sur interface graphique
void dessinPlateau() {
  background(152, 190, 100);
  for (int x = 0; x<64; x++) {
    fill(#9EAA02);
    rect(25+16*x, 25, 16, 20);
    fill(#446e4f);
    rect(25+16*x, 45, 16, 10+11*playerNumber);
    //case laby (vert)
    if (x==42) {
      fill (#129000);
      rect(25+16*x, 45, 16, 10+11*playerNumber);
    }
    //case tete de mort (rouge)
    if (x == 58) {
      fill (#8E0000);
      rect(25+16*x, 45, 16, 10+11*playerNumber);
    }
    //case Oies (bleu)
    if (x == 9 || x == 18 || x == 27 || x == 36 || x == 45 || x== 54) {
      fill (#00AFDE);
      rect(25+16*x, 45, 16, 10+11*playerNumber);
    }
    //case hotel (rose)
    if (x == 19) {
      fill (#FF0D9F);
      rect(25+16*x, 45, 16, 10+11*playerNumber);
    }
    //case puit (noir)
    if (x == 3) {
      fill(#121212);
      rect(25+16*x, 45, 16, 10+11*playerNumber);
    }
    //case prison (jaune)
    if (x == 52) {
      fill(#e37922);
      rect(25+16*x, 45, 16, 10+11*playerNumber);
    }
    //numéro de case
    fill(0);
    textSize(13);
    if (x < 10) {
      text(x, 30+16*x, 40);
    } else {
      text(x, 27+16*x, 40);
    }
  }
  //légende cases spé
  fill(0);
  text(" Légende des cases :", 5, 365);
  //carré vert : labyrinthe
  fill (#129000);
  rect(9, 375, 15, 15);
  fill(0);
  text("= Labyrinthe", 30, 387);
  //carré rouge : tete de mort
  fill (#8E0000);
  rect(110, 375, 15, 15);
  fill(0);
  text("= Tete de mort", 130, 387);
  //carré bleu : oies
  fill (#00AFDE);
  rect(230, 375, 15, 15);
  fill(0);
  text("= Oies", 250, 387);
  //carré rose : hotel
  fill (#FF0D9F);
  rect(300, 375, 15, 15);
  fill(0);
  text("= Hotel", 320, 387);
  //carré noir : puit
  fill (#121212);
  rect(370, 375, 15, 15);
  fill(0);
  text("= Puit", 390, 387);
  //carré jaune : prison
  fill (#e37922);
  rect(430, 375, 15, 15);
  fill(0);
  text("= Prison", 450, 387);
}


void initialisation() {
  if (!initialisation) {
    // création tableaux qui contiennent la position, la couleur de chaque joueur
    // le nombre de tour bloqués à l'hotel, s'ils sont bloqués dans le puit
    playerPos = new int[playerNumber];
    playerColor = new color[playerNumber];
    turnHotelPlayer= new int[playerNumber];
    stuckPuit = new boolean[playerNumber];
    stuckPrison = new boolean[playerNumber];
    //initialisation des couleurs de chaque
    for (int x = 0; x < playerNumber; x++) {
      playerColor[x]= color(random(256), random(256), random(256));
    }
    manche++;
    initialisation = true;
  }
}
//fonction qui permet 1 boucle de playerTurn par boucle de draw()
void uneBouclePlayerTurn() {
  if (compteurBoucle<playerNumber) {
    playerTurn(compteurBoucle);
    compteurBoucle++;
    if (compteurBoucle==playerNumber) {
      compteurBoucle = 0;
      manche++;
    }
  }
}

//gestion des tours de joueurs
void playerTurn(int x) {
  joueurEnCours = x;
  if (turnHotelPlayer[x] == 0 && !stuckPuit[x] && !stuckPrison[x]) {
    deplacement(x);
  } else {
    turnHotelPlayer[x]--;
  }
  fill(playerColor[x]);
  ellipse(coordCase[playerPos[x]], coordCaseY+5+x*12, 8, 8);
  fill(0);
  textSize(20);
  text("Position de ", 25, 90+12*(playerNumber-1)+30*x);
  fill(playerColor[x]);
  ellipse(133, (84+12*(playerNumber-1)+30*x), 15, 15);
  fill(0);
  textSize(20);
  text(": "+playerPos[x], 145, 90+12*(playerNumber-1)+30*x);
  for (int y = 0; y < playerNumber; y++) {
    if (y != x) {
      fill(playerColor[y]);
      ellipse(coordCase[playerPos[y]], coordCaseY+5+y*12, 8, 8);
      fill(0);
      textSize(20);
      text("Position de ", 25, 90+12*(playerNumber-1)+30*y);
      fill(playerColor[y]);
      ellipse(133, (84+12*(playerNumber-1)+30*y), 15, 15);
      fill(0);
      textSize(20);
      text(": "+playerPos[y], 145, 90+12*(playerNumber-1)+30*y);
    }
  }
}


//définit jusqu'à quelle position se déplacer selon un lancer de 2 dés aléatoire
int deplacement(int x) {
  lancerDeTour = lancerDe();
  playerPos[x] += lancerDeTour;
  fill(0);
  textSize(20);
  text("Tu avances de "+lancerDeTour+" cases !", 200, 200);
  testPosition(x);
  return lancerDeTour;
}

//lancer de 2 dés
int lancerDe() {
  int de1 = int(random(1, 7));
  int de2 = int(random(1, 7));
  int total = de1+de2;
  textSize(20);
  text("Tu fais " + de1 +" et " + de2 + " :", 200, 170);
  //ajout règles spé premier tour
  if (manche == 1) {
    if ((de1 == 6 || de1 == 3) && (de2 == 6 || de2 == 3) && total == 9) {
      total = 26;
      textSize(20);
      text("Tu fais un 9 avec un 6 et un 3, go en case 26 :", 350, 170);
    } else if ((de1 == 4 || de1 == 5) && (de2 == 4 || de2 == 5) && total == 9) {
      total = 53;
      textSize(20);
      text("Tu fais un 9 avec un 4 et un 5, go en case 53 :", 350, 170);
    } else if (total == 6) {
      total = 12;
      textSize(20);
      text("Tu fais un 6, go en case 12 :", 350, 170);
    }
  }
  return total;
}

//vérifie s'il se passe quelque chose sur la case où le joueur se trouve
void testPosition(int x) {
  boolean modif = true;
  while (modif) {
    println("le joueur "+ (x+1)+ " est en "+playerPos[x]);
    if (playerPos[x]>63) {
      playerPos[x] = 63 - (playerPos[x]-63);
    } else if (playerPos[x] == 9 || playerPos[x] == 18 || playerPos[x] == 27 || playerPos[x] == 36 || playerPos[x] == 45 || playerPos[x] == 54) {
      caseOie(x);
    } else if (playerPos[x] == 42) {
      caseLabyrinthe(x);
    } else if (playerPos[x] == 58) {
      caseTeteDeMort(x);
    } else if (playerPos[x] == 19) {
      caseHotel(x);
      modif = false;
    } else if (playerPos[x] == 3) {
      casePuit(x);
      modif = false;
    } else if (playerPos[x] == 52) {
      casePrison(x);
      modif = false;
    } else if (playerPos[x] == 63) {
      textSize(20);
      text("VICTOIRE de ", 300, 260);
      fill(playerColor[joueurEnCours]);
      ellipse(415, 253, 15, 15);
      stop();
      modif = false;
    } else {
      modif = false;
    }
  }
}




//stocke coordonnée de chaque case dans un tableau
void coordCasePlateau() {
  coordCase = new int[64];
  for (int i = 0; i < 64; i++) {
    coordCase[i]=25+16*i+8;
  }
}

//cases spéciales OIE : case 9, 18, 27, 36, 45, 54
void caseOie(int x) {
  playerPos[x] += lancerDeTour;
  textSize(20);
  text("Case Oie : tu ré-avances de "+lancerDeTour+" cases!", 200, 230);
}

//case spé LABYRINTHE : case 42
void caseLabyrinthe(int x) {
  playerPos[x] = 30;
  textSize(20);
  text("Case Labyrinthe: tu te perds et tu retournes en case 30!", 200, 230);
}

//case spé TETE DE MORT : case 58
void caseTeteDeMort(int x) {
  playerPos[x] = 0;
  textSize(20);
  text("Case Tête de Mort : retour au début", 200, 230);
}

//case spé HOTEL : case 19
void caseHotel(int x) {
  turnHotelPlayer[x] = 2;
}

//case spé PUIT : case 3
void casePuit(int x) {
  stuckPuit[x] = !stuckPuit[x];
  for (int y = 0; y < playerNumber; y++) {
    if (y != x && stuckPuit[y]) {
      stuckPuit[y] = !stuckPuit[y];
    }
  }
}

//case spé PRISON : case 52
void casePrison(int x) {
  boolean someoneIn = false;
  //vérifie si quelqu'un était en prison, si c'est le cas, il est libéré
  //et renvoie l'info comme quoi quelqu'un y était
  for (int y = 0; y < playerNumber; y++) {
    if (stuckPrison[y]) {
      stuckPrison[y] = !stuckPrison[y];
      someoneIn = true;
      println("personne libérée");
      noLoop();
      //si je n'ai libéré personne, alors je vais en prison
      if (!someoneIn) {
        println("personne de libéré, t'es québlo");
        stuckPrison[x] = !stuckPrison[x];
        noLoop();
      }
    }
  }
}

void mouseClicked() {
  loop();
}
