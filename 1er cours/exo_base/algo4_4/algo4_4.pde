void setup() {
  tailleTableau = 4;
  initBoard(tailleTableau);
  mineNumber = 8;
  modifyValue(tailleTableau, mineNumber, board);
  printBoard(board, tailleTableau);
  isAMine(3,3);
  getMines(3,3);
}


int tailleTableau;
int[][] board;
int mineNumber;

//crée un tableau rempli de 0
void initBoard(int n) {
  board = new int[tailleTableau][tailleTableau];
  for (int j = 0; j < n; j++) {
    for (int i = 0; i < n; i++) {
      board[j][i]=0;
    }
  }
}

//place aléatoirement des mines en remplçant le 0 par 99
void modifyValue(int n, int m, int[][] x) {
  int positionMineX;
  int positionMineY;
  for (int i = 0; i < m; i++) {
    //attribue une valeur de case aléatoire à chaque mine
    positionMineX = int(random(0, n));
    positionMineY = int(random(0, n));
    //test si la position aléatoire a déjà été attribuée à une mine, si c'est le cas, la boucle en cours ne compte pas
    if (x[positionMineX][positionMineY]==99) {
      i -= 1;
    }
    x[positionMineX][positionMineY]=99;
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
    println("BOOM");
    return true;
  } else {
    println("Ouf!");
    return false;
  }
}

//teste la présence de mines dans les cases à côté
void getMines(int testX, int testY) {
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
  if (testX-1 < tailleTableau) {
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
  if (testY-1 < tailleTableau) {
    yMinus1 = true;
  } else {
    yMinus1 = false;
  }
  if (!x || !y){
    println("Veuillez rentrez des coordonnées valides!");
    return;
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
  println("Il y a " + minesProches + " mine" + (minesProches>1 ? "s" : "")+ " à côté de cette case.");
}
