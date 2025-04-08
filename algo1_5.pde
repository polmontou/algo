int position = 0;
int nb_dep = 0;
float distance_moyenne_dep = 0;

void TOTOMODIFY() {
  println(position);
  walk();
  jump();
  jump();
  walk();
  walk();
  println(nb_dep);
  calcul();
}

void walk(){
  position += 1;
  nb_dep += 1;
  println(position);
}

void jump(){
  position += 2;
  nb_dep += 1;
  println(position);
}

void calcul(){
 distance_moyenne_dep = float(7)/nb_dep;
 println(distance_moyenne_dep);
}
