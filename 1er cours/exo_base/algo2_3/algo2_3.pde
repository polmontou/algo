int nombreDeBillets = 0;
float prixBillet5 = 10.5;
float prixBillet6Plus = 9;

void setup(){
  float total = calculePrix(6);
  println("Cela vous coûtera "+ total + " euros, s'il vous plaît");  
}

float calculePrix(int nombreDeBillets){
  float prix = 0;
  if(nombreDeBillets<6){
    prix = nombreDeBillets * prixBillet5;
  }
  else{
    prix = nombreDeBillets * prixBillet6Plus;
  }  
  println("Pour "+ nombreDeBillets + " personnes, cela fera :");
  println(prix + " euros, s'il vous plaît.");
  return prix;
}
