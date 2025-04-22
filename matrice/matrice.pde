void setup() {
  int[][] matrice1 = new int[tailleMatrice][tailleMatrice];
  int[][] matrice2 = new int[tailleMatrice][tailleMatrice];
  int[][] matrice3 = new int[tailleMatrice][tailleMatrice];
  initRandMatrice(matrice1);
  println("Ma matrice 1 est :");
  afficheMatrice(matrice1);
  initRandMatrice(matrice2);
  println("Ma matrice 2 est :");
  afficheMatrice(matrice2);
  additionneMatrice(matrice1,matrice2,matrice3);
  println("L'addtion de la matrice 1 et 2 donne :");
  afficheMatrice(matrice3);
  //afficheDiagoMatrice(matrice1, true);
  //afficheColRowMatrice(matrice1, true, 4);
}

int tailleMatrice = 4;


void initRandMatrice(int[][] matrice) {
  for (int y = 0; y < tailleMatrice; y++) {
    for (int x = 0; x < tailleMatrice; x++) {
      matrice[x][y] = int(random(-9, 10));
    }
  }
}

void afficheMatrice(int[][] matrice) {
  for (int y = 0; y < tailleMatrice; y++) {
    for (int x = 0; x < tailleMatrice; x++) {
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
    while (x < tailleMatrice && y < tailleMatrice) {
      print(matrice[x][y]+(x == tailleMatrice-1 ? "." : ", "));
      x ++;
      y ++;
    }
  } else {
    int x = tailleMatrice-1;
    int y = 0;
    print("La diagonale de droite à gauche est : ");
    while (x < tailleMatrice && y < tailleMatrice) {
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
    for (int y = 0; y < tailleMatrice; y++) {
      print(matrice[x][y]+(y == tailleMatrice-1 ? ".":", "));
    }
  } else {
    int y = numColRow-1;
    print("La ligne n°"+numColRow+" contient : ");
    for (int x = 0; x < tailleMatrice; x++) {
      print(matrice[x][y]+(x == tailleMatrice-1 ? ".":", "));
    }
  }
}

void additionneMatrice(int[][] matrice1, int[][] matrice2, int[][] matrice3) {
  for (int y = 0; y < tailleMatrice; y++) {
    for (int x = 0; x < tailleMatrice; x++) {
      matrice3[x][y] = matrice1[x][y]+matrice2[x][y];
    }
  }
}
