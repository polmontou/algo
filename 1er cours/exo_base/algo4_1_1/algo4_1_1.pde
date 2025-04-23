void setup() {
  getSum(testCalcul);
}

int[] testCalcul = {8, 9, -7, 56, -4, 12, 6, 78, -38, -20};

void getSum(int[] x) {
  int total = 0;
  for (int index = 0; index < x.length; index++) {
    total += x[index];
  }
  println("Le total de cette liste est de "+total+".");
}
