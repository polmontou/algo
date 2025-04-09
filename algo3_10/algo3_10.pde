void setup() {
  primeFromOneToX(100);
}

void primeFromOneToX(int x) {
  println("La liste des nombres premiers de 1 à "+x+" est :");
  for (int z = 1; z <= x; z++) { 
    int test = 0;
    for (int y = 2; y < z; y++) {
      if (z%y == 0) {
        test += 1 ;
      }
    }
    if (test == 0) {
      println(z);
    }
  }
}
