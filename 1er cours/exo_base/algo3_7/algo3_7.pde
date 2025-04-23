void setup() {
  totalDeUnAMonEntier(100);
}

void totalDeUnAMonEntier(int x) {
  int total = 0;
  for(int compteur = 0; (compteur <= x); compteur++) {
    total += compteur;
  }
  println("Le total des nombres allant de 1 à " + x +" est de "+ total);
}
