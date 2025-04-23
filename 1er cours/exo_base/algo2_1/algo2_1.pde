int nombreDeBillets = 0;
float prixBillet5 = 10.5;


void setup(){
  calculePrix(9);
  calculePrix(4);
}

void calculePrix(int nombreDeBillets){
  println("Pour "+ nombreDeBillets + " personnes, cela fera :");
  println(prixBillet5 * nombreDeBillets + " euros, s'il vous plaît.");
}
