void draw() {
  playerNumber = 1;
  dessinPlateau();
  playerTurn();
  noLoop();
}

void setup() {
  size(1200, 400);
  coordCasePlateau();
}


//définition variable
int[] coordCase;
int coordCaseY = 50;
int position = 0;
int manche = 0;
int lancerDeTour;
String joueurEnCours;
int playerNumber;
color[] playerColor;
int[] playerPos;


//dessine case sur interface graphique
void dessinPlateau() {
  background(152, 190, 100);
  for (int x = 0; x<63; x++) {
    fill(#9EAA02);
    rect(25+16*x, 25, 16, 50);
    //case laby (vert)
    if (x==29) {
      fill (#129000);
      rect(25+16*x, 25, 16, 50);
    }
    //case tete de mort (rouge)
    if (x == 57) {
      fill (#8E0000);
      rect(25+16*x, 25, 16, 50);
    }
    //case Oies (bleu)
    if (x == 8 || x == 17 || x == 26 || x == 35 || x == 44 || x== 53) {
      fill (#00AFDE);
      rect(25+16*x, 25, 16, 50);
    }
    //case hotel (rose)
    if (x == 18) {
      fill (#FF0D9F);
      rect(25+16*x, 25, 16, 50);
    }
    //numéro de case
    fill(0);
    textSize(13);
    if (x+1 < 10) {
      text(x+1, 30+16*x, 40);
    } else {
      text(x+1, 27+16*x, 40);
    }
  }
  //légende cases spé
  fill(0);
  text(" Légende des cases:", 3, 370);
  //carré vert : labyrinthe
  fill (#129000);
  rect(7, 375, 15, 15);
  fill(0);
  text("= Labyrinthe", 27, 387);
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
}
//gestion des tours de joueurs
void playerTurn() {
  if (manche == 0) {
    //initialisation des couleurs de chaque
    for (int x = 0; x < playerNumber; x++) {
      playerColor = append(playerColor, color(random(256), random(256), random(256)));
      playerPos = new int[playerNumber];
    }
    manche++;
    for (int x = 0; x < playerNumber; x++) {
      int deplacement = deplacement();
      fill(255);
      ellipse(coordCase[deplacement-1], coordCaseY, 8, 8);
      fill(0);
      textSize(20);
      text("Position de ", 25, 100);
      fill(playerColor[x]);
      ellipse(70, 100+30*x, 20, 20);
    }
  }
}
//position du premier pion selon sa position + attribution victoire si position == 63
void positionBlanc() {
  joueurEnCours = "BLANC";
  manche++;
  int deplacement = deplacement();
  fill(255);
  ellipse(coordCase[deplacement-1], coordCaseY, 8, 8);
  fill(0);
  textSize(20);
  text("Position de Blanc : "+deplacement, 25, 100);
}

//définit jusqu'à quelle position se déplacer selon un lancer de 2 dés aléatoire
int deplacement() {
  lancerDeTour = lancerDe();
  position += lancerDeTour;
  testPosition();
  textSize(20);
  text("Tu avances de "+lancerDeTour+" cases", 200, 150);
  return position;
}

//lancer de 2 dés
int lancerDe() {
  int de1 = int(random(1, 7));
  int de2 = int(random(1, 7));
  int total = de1+de2;
  //ajout règles spé premier tour
  if (manche == 1) {
    if ((de1 == 6 || de1 == 3) && (de2 == 6 || de2 == 3) && total == 9) {
      total = 26;
      textSize(20);
      text("Tu fais de 9 avec un 6 et un 3, go en case 26!", 200, 200);
    } else if ((de1 == 4 || de1 == 5) && (de2 == 4 || de2 == 5) && total == 9) {
      total = 53;
      textSize(20);
      text("Tu fais de 9 avec un 4 et un 5, go en case 53!", 200, 200);
    } else if (total == 6) {
      total = 12;
      textSize(20);
      text("Tu fais un 6, go en case 12!", 200, 200);
    }
  }
  return total;
}


int testPosition() {
  boolean modif = true;
  while (modif) {
    if (position>63) {
      position = 63 - (position-63);
    }
    if (position == 9 || position == 18 || position == 27 || position == 36 || position == 45 || position == 54) {
      caseOie();
    } else if (position == 42) {
      caseLabyrinthe();
    } else if (position == 58) {
      caseTeteDeMort();
    } else if (position == 19) {
    } else if (position == 63) {
      textSize(20);
      text("VICTOIRE de + "+joueurEnCours, 200, 200);
      stop();
      modif = false;
    } else {
      modif = false;
    }
  }
  return position;
}




//stocke coordonnée de chaque case dans un tableau
void coordCasePlateau() {
  coordCase = new int[63];
  for (int i = 0; i < 63; i++) {
    coordCase[i]=25+16*i+8;
  }
}

//cases spéciales OIE : case 9, 18, 27, 36, 45, 54
void caseOie() {
  position += lancerDeTour;
  textSize(20);
  text("Case Oie : tu ré-avances de "+lancerDeTour+" cases!", 200, 200);
}

//case spé LABYRINTHE : case 42
void caseLabyrinthe() {
  position = 30;
  textSize(20);
  text("Case Labyrinthe: tu te perds et tu retournes en case 30!", 200, 200);
}

void caseTeteDeMort() {
  position = 1;
  textSize(20);
  text("Case Tête de Mort : retour au début", 200, 200);
}

void mouseClicked() {
  loop();
}
