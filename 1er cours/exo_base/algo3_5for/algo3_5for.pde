void setup(){
  plusPetitCarréSup(30);
}
void plusPetitCarréSup(int x){
  for(int y = 1; y <= 100;y++){
    if (y*y > x){
      println("Le plus petit carré supérieur de "+x+" est "+y+" x "+y+" = "+(y*y));
      break;
    }
  }

}
