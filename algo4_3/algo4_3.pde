void setup() {
  tailleTableau = 10;
  initBoard(tailleTableau);
  mineNumber = 3;
  modifyValue(tailleTableau, mineNumber, board);
  printBoard(board, tailleTableau);
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
    x[positionMineX][positionMineY]=99;
  }
}
//affiche le tableau dans le démineur
void printBoard(int[][] x, int n) {
  for (int j = 0; j < n; j++) {
    for (int i = 0; i < n; i++) {
      if (x[j][i]==0) {
        print("0"+x[j][i]+" ");
      } else {
        print(x[j][i] + " ");
      }
    }
    println();
  }
}
