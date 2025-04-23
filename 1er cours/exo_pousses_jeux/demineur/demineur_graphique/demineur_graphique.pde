void setup() {
  size(300, 300);
  tailleTableau = 9;
  initBoard(tailleTableau);
  mineNumber = 20;
  modifyValue(tailleTableau, mineNumber, board);
  printBoard(board, tailleTableau);
  dessinTableau(tailleTableau);
}

void draw() {
}


int tailleTableau;
int[][] board;
int mineNumber;

//crée un tableau rempli de 0
void initBoard(int tailleTableau) {
  board = new int[tailleTableau][tailleTableau];
  for (int x = 0; x < tailleTableau; x++) {
    for (int y = 0; y < tailleTableau; y++) {
      board[x][y]=0;
    }
  }
}

//place aléatoirement des mines en remplçant le 0 par 99
void modifyValue(int tailleTableau, int mineNumber, int[][] board) {
  int positionMineX;
  int positionMineY;
  if (mineNumber <= (tailleTableau*tailleTableau)) {
    int minesPosees = 0;
    while (minesPosees != mineNumber) {
      positionMineX = int(random(0, tailleTableau));
      positionMineY = int(random(0, tailleTableau));
      if (board[positionMineX][positionMineY]!=99) {
        board[positionMineX][positionMineY]=99;
        minesPosees += 1;
      }
    }
  } else {
    println("Trop de mines!");
    exit();
  }
}

//affiche le tableau dans la console
void printBoard(int[][] x, int n) {
  for (int j = 0; j < n; j++) {
    for (int i = 0; i < n; i++) {
      if (x[j][i]!=99) {
        print("0"+x[j][i]+" ");
      } else {
        print(x[j][i] + " ");
      }
    }
    println();
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

//teste la présence de mines dans les cases à côté
int getMines(int testX, int testY) {
  int minesProches = 0;
  //teste si les positions des cases autour existe
  boolean x;
  boolean xPlus1;
  boolean xMinus1;
  boolean y;
  boolean yPlus1;
  boolean yMinus1;
  if (testX < tailleTableau) {
    x = true;
  } else {
    x = false;
  }
  if (testX+1 < tailleTableau) {
    xPlus1 = true;
  } else {
    xPlus1 = false;
  }
  if ( 0 <= testX-1 && testX-1 < tailleTableau) {
    xMinus1 = true;
  } else {
    xMinus1 = false;
  }
  if (testY < tailleTableau) {
    y = true;
  } else {
    y = false;
  }
  if (testY+1 < tailleTableau) {
    yPlus1 = true;
  } else {
    yPlus1 = false;
  }
  if (0 <= testY-1 && testY-1 < tailleTableau) {
    yMinus1 = true;
  } else {
    yMinus1 = false;
  }
  if (!x || !y) {
    println("Veuillez rentrez des coordonnées valides!");
    return 0;
  }
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

color colorOdd = color(219, 75, 75);
color colorEven = color(240, 140, 78);
color colorSafeClick = color(186, 228, 71);
color colorLoss = color(255, 0, 0);
//dessine rectangle selon taille tableau, alterne la couleur des cases en quinconces
void dessinTableau(int n) {
  for (int j = 0; j < n; j++) {
    if ((j+2)%2 != 0) {
      for (int i = 0; i < n; i++) {
        if ((i+2)%2 != 0) {
          fill(colorOdd);
          rect(20+j*20, 20+i*20, 20, 20);
        } else {
          fill(colorEven);
          rect(20+j*20, 20+i*20, 20, 20);
        }
      }
    } else {
      for (int i = 0; i < n; i++) {
        if ((i+2)%2 != 0) {
          fill(colorEven);
          rect(20+j*20, 20+i*20, 20, 20);
        } else {
          fill(colorOdd);
          rect(20+j*20, 20+i*20, 20, 20);
        }
      }
    }
  }
}

void mouseClicked() {
  if ((20 > mouseY || mouseY > 20+20*tailleTableau || 20 > mouseX || mouseX > 20+20*tailleTableau)) {
    textSize(18);
    fill(0);
    text("Faut apprendre à viser!", 20, 20*(tailleTableau+2));
  } else {
    int posMouseY = mouseX;
    int posMouseX = mouseY;
    if (isAMine(((posMouseX-20)/20), ((posMouseY-20)/20))) {
      fill(colorLoss);
      rect(float(((posMouseY-20)/20)*20)+20, float(((posMouseX-20)/20)*20)+20, 20, 20);
      textSize(18);
      fill(0);
      text("X", ((posMouseY/20)*20)+6, ((posMouseX/20)*20)+16);
      text("BOOM", 20, 20*(tailleTableau+2));

      exit();
    } else {
      fill(colorSafeClick);
      rect(float(((posMouseY-20)/20)*20)+20, float(((posMouseX-20)/20)*20)+20, 20, 20);
      textSize(18);
      fill(0);
      text(getMines(((posMouseX-20)/20), ((posMouseY-20)/20)), ((posMouseY/20)*20)+6, ((posMouseX/20)*20)+16);
    }
  }
}
