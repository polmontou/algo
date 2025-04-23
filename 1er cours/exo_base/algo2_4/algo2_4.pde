int position = 0;

void setup() {
  while (position<7){
    go();
  }
  println("Congrats you've reached the end");
}

boolean isNearWater(){
  if (position == 1 || position == 3){
    return true;
  }
  else{
    return false;
  }
    
}

void go(){
  if (isNearWater() == true){
    jump();
  }
  else{
    walk();
  }
}

void walk(){
  position += 1;
  println("You walk, you're on the "+ position + (position<2 ? "st":"th") + " position.");
}

void jump(){
  position += 2;
  println("You jump, you're on the "+ position + (position<2 ? "st":"th") + " position.");
}
