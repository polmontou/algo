void mouton(int x, int y) {
  fill(255);
  stroke(0);
  rect(x, y, 100, 50);
  rect(x+100, y, 40, 25);
  rect(x+10, y+50, 10, 20);
  rect(x+30, y+50, 10, 20);
  rect(x+60, y+50, 10, 20);
  rect(x+80, y+50, 10, 20);
  fill(255, 0, 0);
  stroke(0);
  ellipse(x+110, y+10, 5, 5);
}

void setup() {
  size(500,500);
  mouton(100,100);
  mouton(300, 100);
}
