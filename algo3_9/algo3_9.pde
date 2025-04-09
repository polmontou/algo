void setup() {
  isPrime(6);
}

void isPrime(int x) {
  int test = 0;
  for (int y = 2; y < x; y++) {
    if (x%y == 0) {
      test += 1 ;
    }
  }
  if (test == 0) {
    println(x+" est bien un nombre premier!");
  } else {
    println(x+" n'est pas un nombre premier!");
  }
}
