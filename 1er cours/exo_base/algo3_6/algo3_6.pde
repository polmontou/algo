void setup() {
  plusGrandCarréInf(66);
}

void plusGrandCarréInf(int x) {
  int y = 0;
  while((y*y) <= x){
    y++;
  }
  y--;
  println("Le plus grand carré inférieur de "+x+" est "+y+" x "+y+" = "+(y*y));
}
