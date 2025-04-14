void setup() {
  size(1000, 200);
  //lancerDés(position);
  dessinPlateau();
}

int position = 0;
void lancerDés (int position) {
  int manche = 0;
  while (position != 63) {
    manche++;
    int deUn = int(random(1, 7));
    int deDeux = int(random(1, 7));
    int lancer = deUn+deDeux;
    position += lancer;
    println(position);
    if (position > 63) {
      position = 63 - (position -63);
      println("gobackto : " + position);
    }
  }
  println("victoire! en "+manche+" manches");
}


void dessinPlateau() {
  color colorEven = color(240, 140, 78);
  for (int x = 0; x<63; x++) {
    fill(colorEven);
    rect(25+15*x, 25, 15, 50);
    fill(0);
    if (x+1 < 10) {
      text(x+1, 30+15*x, 45);
    } else {
      text(x+1, 27+15*x, 45);
    }
  }
}
