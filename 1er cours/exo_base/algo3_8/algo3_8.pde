void setup() {
  suiteDeSyracuse(3);
}

void suiteDeSyracuse(int x) {
  int resultat = x;
  println("Voici votre suite de Syracuse pour le nombre "+x+":");
  while (resultat != 1) {
    if (resultat % 2 == 0) {
      resultat = resultat/2;
      println(resultat+" ");
    } else {
      resultat = resultat * 3 + 1;
      println(resultat+" ");
    }
  }
}
