void setup(){
  int win = 0;
  while (win<10){
   int r = int(random(0,12));
   println(r);
   if (r <= 10){
     println("T'as perdu!");
  } 
   else{
     win ++;
     println("Et de", win, "victoire !");
   }
 }
}
