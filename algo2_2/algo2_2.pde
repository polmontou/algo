int nombreDeBillets = 0;
float prixBillet5 = 10.5;


void setup(){
  float total = calculePrix(9) + calculePrix(4);
  println("Cela vous coûtera "+ total + " euros au total, s'il vous plaît.");  
}

float calculePrix(int nombreDeBillets){
  float prix = 0;
    prix = nombreDeBillets * prixBillet5; 
  println("Pour "+ nombreDeBillets + " personnes, cela fera :");
  println(prix + " euros, s'il vous plaît.");
  return prix;
}
