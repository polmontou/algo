void setup() {
  getMean(testCalcul);
}

int[] testCalcul = {8, 9, -7, 56, -4, 12, 6, 78, -38, -20};

void getMean(int[] x) {
  int total = 0;
  for (int index = 0; index < x.length; index++) {
    total += x[index];
  }
  float mean = total / x.length; 
  println("La moyenne de cette liste est de "+mean+".");
}
