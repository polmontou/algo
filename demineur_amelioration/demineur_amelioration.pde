void setup() {
  size(400, 400);
  arraySize = 5;
  wishedMines = 1;
  initBoard(arraySize);
  putMines(board, wishedMines, arraySize);
  printBoard(board, arraySize);
  dessinTableau(arraySize);
  println(arraySize*arraySize-wishedMines);
}

void draw() {
    if (safeCase == ((arraySize*arraySize)-wishedMines)) {
      textSize(50);
      fill(0);
      text("VICTOIRE", 100, 25*(arraySize+5));
    }
}
int safeCase=0;
int wishedMines;
int[][] board;
int[][] boardbis;
int arraySize;

//créer mon talbeau selon la taille voulue
void initBoard(int arraySize) {
  board = new int[arraySize][arraySize];
}

//imprime mon tableau dans la console
void printBoard(int[][] board, int arraySize) {
  for (int y = 0; y < arraySize; y++) {
    for (int x = 0; x < arraySize; x++) {
      print((board[x][y]<10 ? "0" : "") + board[x][y]+" ");
    }
    println();
  }
}

//pose des mines dans mon tableau en modifiant la valeur de 0 (neutre) à 99(mine)
void putMines (int[][] board, int wishedMines, int arraySize) {
  int minesPut = 0;
  if (wishedMines <= (arraySize*arraySize)) {
    while (minesPut != wishedMines) {
      int posMineX = int(random(0, arraySize));
      int posMineY = int(random(0, arraySize));
      if (board[posMineX][posMineY] != 99) {
        board[posMineX][posMineY] = 99;
        minesPut++;
      }
    }
    //définit un nombre de mines aléatoire si on demande + de mines que de cases dispo
  } else {
    wishedMines = arraySize*arraySize/2;
    while (minesPut != wishedMines) {
      int posMineX = int(random(0, arraySize));
      int posMineY = int(random(0, arraySize));
      if (board[posMineX][posMineY] != 99) {
        board[posMineX][posMineY] = 99;
        minesPut++;
      }
    }
  }
}


//teste si une case est une mine
boolean isAMine(int x, int y) {
  if (board[x][y] == 99) {
    return true;
  } else {
    return false;
  }
}

//permet de savoir combien de mines présentes dans les cases autour
int getMines(int testX, int testY) {
  int minesProches = 0;
  //teste si les positions des cases autour existe
  boolean xPlus1 = (testX+1) < arraySize ;
  boolean xMinus1 = (0 <= testX-1) && (testX-1 < arraySize);
  boolean yPlus1 = (testY+1) < arraySize ;
  boolean yMinus1 = (0 <= testY-1) && (testY-1 < arraySize);
  if (xMinus1 && yMinus1 && board[testX-1][testY-1]==99) {
    minesProches += 1;
  }
  if (xMinus1 && board[testX-1][testY]==99) {
    minesProches +=1;
  }
  if (xMinus1 && yPlus1 && board[testX-1][testY+1]==99) {
    minesProches +=1;
  }
  if (yMinus1 && board[testX][testY-1]==99) {
    minesProches +=1;
  }
  if (yPlus1 && board[testX][testY+1]==99) {
    minesProches +=1;
  }
  if (xPlus1 && yMinus1 && board[testX+1][testY-1]==99) {
    minesProches +=1;
  }
  if (xPlus1 && board[testX+1][testY]==99) {
    minesProches +=1;
  }
  if (xPlus1 && yPlus1 && board[testX+1][testY+1]==99) {
    minesProches +=1;
  }
  return minesProches;
}
//censé tester les cases autour si celle choisie est safe et mets en vert les cellules autour

void getNoMine(int coordX, int coordY) {
  //teste si les positions des cases autour existe
  if (getMines(coordX, coordY) == 0 ) {
    for (int y = coordY-1; y < coordY +2; y++) {
      for (int x = coordX-1; x < coordX +2; x++) {
        if ( 0 <= y && y < arraySize && 0 <= x && x < arraySize && !(y == coordY && x == coordX)) {
          fill(colorSafeClick);
          rect((x+1)*25, (y+1)*25, 25, 25);
          textSize(22);
          fill(0);
          text(getMines(x, y), ((x+1)*25)+8, ((y+2)*25)-6);
          if (board[x][y] == 0) {
            safeCase++;
          }  
          board[x][y] ++;
          println(safeCase);
        }
      }
    }
  }
}

color colorOdd = color(219, 75, 75);
color colorEven = color(240, 140, 78);
color colorSafeClick = color(186, 228, 71);
color colorLoss = color(255, 0, 0);

void dessinTableau(int n) {
  for (int j = 0; j < n; j++) {
    for (int i = 0; i < n; i++) {
      fill(colorEven);
      rect(25+j*25, 25+i*25, 25, 25);
    }
  }
}

void mouseClicked() {
  int mousePosX = mouseX;
  int mousePosY = mouseY;
  if ((mouseButton == LEFT)) {
    leftClick(mousePosX, mousePosY);
  } else if (mouseButton == RIGHT) {
    rightClick(mousePosX, mousePosY);
  }
}

//gestion clic droit (verrou case)
void rightClick(int mousePosX, int mousePosY) {
  int coordX = (mousePosX-25)/25;
  int coordY = (mousePosY-25)/25;
  int verrouPossible = 0;
  if ((25 > mouseY || mouseY > 25+25*arraySize || 25 > mouseX || mouseX > 25+25*arraySize)) {
    textSize(18);
    fill(0);
    text("Faut apprendre à viser!", 25, 25*(arraySize+2));
  } else {
    if ((board[coordX][coordY] == 0 || board[coordX][coordY] == 99) && verrouPossible<=wishedMines) {
      verrouPossible++;
      board[coordX][coordY] += 50;
      fill(colorOdd);
      rect(float(((mousePosX-25)/25)*25)+25, float(((mousePosY-25)/25)*25)+25, 25, 25);
      fill(0);
      textSize(22);
      text("L", ((mousePosX/25)*25)+7, ((mousePosY/25)*25)+20);
    } else {
      verrouPossible--;
      board[coordX][coordY] -= 50;
      fill(colorEven);
      rect(float(((mousePosX-25)/25)*25)+25, float(((mousePosY-25)/25)*25)+25, 25, 25);
    }
  }
}
//gestion clic gauche
void leftClick(int mousePosX, int mousePosY) {
    if ((25 > mouseY || mouseY > 25+25*arraySize || 25 > mouseX || mouseX > 25+25*arraySize)) {
      textSize(18);
      fill(0);
      text("Faut apprendre à viser!", 25, 25*(arraySize+2));
    } else {
      int coordX = (mousePosX-25)/25;
      int coordY = (mousePosY-25)/25;
      if (isAMine(coordX, coordY)) {
        fill(colorLoss);
        stroke(240, 130, 103);
        rect(float(((mousePosX-25)/25)*25)+25, float(((mousePosY-25)/25)*25)+25, 25, 25);
        textSize(22);
        fill(240, 130, 103);
        text("X", ((mousePosX/25)*25)+7, ((mousePosY/25)*25)+20);
        fill(0);
        text("BOOM", 25, 25*(arraySize+2));
        exit();
      } else if (board[coordX][coordY] <= 1) {
        if (board[coordX][coordY] == 0) {
          safeCase++;
        }
        board[coordX][coordY]++;
        greenSafeCase(mousePosX, mousePosY);
        getNoMine(coordX, coordY);
      }
    }
}  

void greenSafeCase(int mousePosX, int mousePosY) {
  fill(colorSafeClick);
  rect(float(((mousePosX-25)/25)*25)+25, float(((mousePosY-25)/25)*25)+25, 25, 25);
  textSize(22);
  fill(0);
  text(getMines(((mousePosX-25)/25), ((mousePosY-25)/25)), ((mousePosX/25)*25)+7, ((mousePosY/25)*25)+20);
}
