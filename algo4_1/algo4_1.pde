void setup() {
  getMax(coucou);
}
int[] coucou= { 7, 2, 9, 10, 1, 26, 4, 12, 89, -25, 7};


void getMax(int[] x) {
  int max = x[0];
  for(int index = 0; index < x.length; index++) {
    if (x[index]>max) {
      max = x[index];
    } 
  }
  println("Le maximum de la liste board est : "+max+".");
}
