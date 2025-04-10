int position = 0;

void setup() {
    go(chemin);
  println("Congrats you've reached the end");
}

// chemin de Toto
boolean[] chemin = {false, true, true, false, false, false, false, false, true, false, false, true};


//détecte s'il y a de l'eau devant lui
//ne sert pas à grand chose, on peut s'en passer car retourne True si la valeur qu'on lui passe est True
boolean isNearWater(boolean x){
  if (x){
    return true;
  }
  else{
    return false;
  }    
}

//décide quoi faire s'il y a de l'eau ou non
void go(boolean[] x){
  for (int index = 0; index < x.length; index++) {
    if (isNearWater(x[index])){
      jump();
    }
    else{
      walk();
    }
  }  
}

//définit fonction walk (absence d'eau)
void walk(){
  position += 1;
  println("You walk, you're on the "+ position + (position<2 ? "st":"th") + " position.");
}

//définit fonction jump (présence d'eau)
void jump(){
  position += 2;
  println("You jump, you're on the "+ position + (position<2 ? "st":"th") + " position.");
}
