void setup() {
  int[][] matrice1 = initRandMatrice(3, 2);
  println("Ma matrice 1 est :");
  afficheMatrice(matrice1);
  int[][] matrice2 = initRandMatrice(2, 3);
  println("Ma matrice 2 est :");
  afficheMatrice(matrice2);
  int[][] produitMatrice = produitMatriciel(matrice1, matrice2);
  println("Mon produit matriciel est : ");
  afficheMatrice(produitMatrice);
}

int tailleMatriceX = 6;
int tailleMatriceY = 2;



int[][] initRandMatrice(int tailleMatriceX, int tailleMatriceY) {
  int [][] matrice = new int[tailleMatriceX][tailleMatriceY];
  for (int y = 0; y < tailleMatriceY; y++) {
    for (int x = 0; x < tailleMatriceX; x++) {
      matrice[x][y] = int(random(-9, 10));
    }
  }
  return matrice;
}

void afficheMatrice(int[][] matrice) {
  for (int y = 0; y < matrice[0].length; y++) {
    for (int x = 0; x < matrice.length; x++) {
      print((matrice[x][y] >= 0 && matrice[x][y] < 10 ? "  ":"")+(matrice[x][y] >= 10 || (matrice[x][y] < 0 && matrice[x][y] > -10) ? " ":"")+matrice[x][y]+"  ");
    }
    println();
  }
}

void afficheDiagoMatrice(int[][] matrice, boolean diago) {
  // diago = true => on démarre de l'index [0][0] et on va à [tailleMatrice-1][tailleMatrice-1]
  // diago = false => on démarre de l'index [tailleMatrice-1][0] et on va à [0][tailleMatrice-1]
  if (diago) {
    int x = 0;
    int y = 0;
    print("La diagonale de gauche à droite est : ");
    while (x < tailleMatriceX && y < tailleMatriceY) {
      print(matrice[x][y]+(x == tailleMatriceX-1 ? "." : ", "));
      x ++;
      y ++;
    }
  } else {
    int x = tailleMatriceX-1;
    int y = 0;
    print("La diagonale de droite à gauche est : ");
    while (x < tailleMatriceX && y < tailleMatriceY) {
      print(matrice[x][y]+(x == 0 ? "." : ", "));
      x --;
      y ++;
    }
  }
  println();
}

void afficheColRowMatrice(int[][] matrice, boolean colRow, int numColRow) {
  //colRow = true => affiche la colonne (coord x)
  //colRow = false => affiche la ligne (coord y)
  if (colRow) {
    int x = numColRow-1;
    print("La colonne n°"+numColRow+" contient : ");
    for (int y = 0; y < tailleMatriceY; y++) {
      print(matrice[x][y]+(y == tailleMatriceY-1 ? ".":", "));
    }
  } else {
    int y = numColRow-1;
    print("La ligne n°"+numColRow+" contient : ");
    for (int x = 0; x < tailleMatriceX; x++) {
      print(matrice[x][y]+(x == tailleMatriceX-1 ? ".":", "));
    }
  }
}

void additionneMatrice(int[][] matrice1, int[][] matrice2, int[][] matrice3) {
  for (int y = 0; y < tailleMatriceY; y++) {
    for (int x = 0; x < tailleMatriceX; x++) {
      matrice3[x][y] = matrice1[x][y]+matrice2[x][y];
    }
  }
}

int[][] transposee(int[][] matrice1) {
  int[][] matriceTransposee = new int[matrice1[0].length][matrice1.length];
  for (int y = 0; y < matrice1[0].length; y++) {
    for (int x = 0; x < matrice1.length; x++) {
      matriceTransposee[y][x] = matrice1[x][y];
    }
  }
  return matriceTransposee;
}

int[][] produitMatriciel(int[][] matrice1, int[][]matrice2) {
  int [][]produitMatrice = new int[matrice2.length][matrice1[0].length];
   for (int y = 0; y < matrice1[0].length; y++) {
     for (int x = 0; x < matrice2.length; x++) {
       for (int z = 0; z < matrice1.length; z++) {
         produitMatrice[x][y] += matrice1[z][y]*matrice2[x][z]; 
       }
     }
   }
   return produitMatrice;
}
