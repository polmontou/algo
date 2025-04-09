void setup() {
  plusPetitCarréSup(30);
}

void plusPetitCarréSup(int x) {
  int y = 1;
  while ((y*y) <= x) {
    y++;
  }
  println("Le plus petit carré supérieur de "+x+" est "+y+" x "+y+" = "+(y*y));
}
