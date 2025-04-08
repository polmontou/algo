int nb_sheep = 0;
int x = 0;
int y = 0;

void setup(){
  fill(0, 255, 0);
  rect(0,0,1000,1000);
  size(1000, 1000);
  while (nb_sheep < 4){
   mouton(x, y);
   x += 150;
   y += 75;
  }
}

void mouton(int x, int y){
  fill (255, 255, 0);
  stroke(0);
  rect(x, y, 100, 50);
  fill(255);
  stroke(0);
  rect(x+100, y, 40, 25);
  rect(x+10, y+50, 10, 20);
  rect(x+30, y+50, 10, 20);
  rect(x+60, y+50, 10, 20);
  rect(x+80, y+50, 10, 20);
  fill(255, 0, 0);
  ellipse(x+110, y +10, 5, 5);
  nb_sheep++;
} 
