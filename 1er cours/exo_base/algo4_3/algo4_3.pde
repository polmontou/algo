void setup() {
  int tailleTableau = 4;
  initBoard(tailleTableau);
  mineNumber = 5;
  modifyValue(tailleTableau, mineNumber, board);
  printBoard(board, tailleTableau);
}



int[][] board;
int mineNumber;

//crée un tableau rempli de 0
void initBoard(int tailleTableau) {
  board = new int[tailleTableau][tailleTableau];
  for (int j = 0; j < tailleTableau; j++) {
    for (int i = 0; i < tailleTableau; i++) {
      board[j][i]=0;
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
  }
}

//attribue une valeur de case aléatoire à chaque mine
//test si la position aléatoire a déjà été attribuée à une mine, si c'est le cas, la boucle en cours ne compte pas

//affiche le tableau dans le démineur
void printBoard(int[][] board, int tailleTableau) {
  for (int y = 0; y < tailleTableau; y++) {
    for (int x = 0; x < tailleTableau; x++) {
      int aAfficher = board[x][y];
      if (aAfficher < 10) {
        print("0"+board[x][y]+" ");
      } else {
        print(board[x][y] + " ");
      }
    }
    println();
  }
}
