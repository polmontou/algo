void setup() {
  //creationListeNotes();
  afficherNotes();
  println("\nJ'ai "+listeNotesDonnee.length+" éléments dans ma liste.");
  println("La note minimum est : "+minimumNote(listeNotesDonnee));
  println("La note maximum est : "+maximumNote(listeNotesDonnee));
  println("La moyenne est de : "+calculeMoyenne(listeNotesDonnee, listeNotesDonnee.length));
  println("La variance est de : "+calculeVariance(listeNotesDonnee, listeNotesDonnee.length));
  println("L'écart-type est de : "+calculeEcartType(calculeVariance(listeNotesDonnee, listeNotesDonnee.length)));
}
int[] listeNotes;
int nombreNotes = 200;
float[] listeNotesDonnee = {12.0, 13.5, 8.5, 14.7, 6.0};


//création d'une liste de notes pouvant aller de 0 à 20
void creationListeNotes() {
  listeNotes = new int[nombreNotes];
  for (int indexNote = 0; indexNote < nombreNotes; indexNote++) {
    listeNotes[indexNote] = int(random(0,21));
  }
}

//affiche l'ensemble des notes
void afficherNotes() {
  print("Ma liste contient : ");
  for(int indexNote = 0; indexNote < listeNotesDonnee.length; indexNote++) {
    print(listeNotesDonnee[indexNote]+((indexNote == (listeNotesDonnee.length-1)) ? "." :", "));
  }
}

//donne la note la plus petite
float minimumNote(float[] listeNotes) {
  float noteMini = 20;
  for (int indexNote = 0; indexNote < listeNotesDonnee.length; indexNote++) {
    if (listeNotes[indexNote] < noteMini) {
      noteMini = listeNotes[indexNote];
    }
  }
  return noteMini;
}

//donne la note la plus grande
float maximumNote(float[] listeNotes) {
  float noteMaxi = 0;
  for (int indexNote = 0; indexNote < listeNotesDonnee.length; indexNote++) {
    if (listeNotes[indexNote] > noteMaxi) {
      noteMaxi = listeNotes[indexNote];
    }
  }
  return noteMaxi;
}

//moyenne de la liste
float calculeMoyenne(float[] listeNotes, int nombreNotes) {
  float total = 0;
  for (int indexNote = 0; indexNote < nombreNotes; indexNote++) {
    total += listeNotes[indexNote];
  }
  float moyenne = total / nombreNotes;
  return moyenne;
}

//calcul variance
float calculeVariance(float[] listeNotesDonnee, int nombreNotes) {
  float sommeVariance = 0;
  for(int indexNote = 0; indexNote < nombreNotes; indexNote++) {
    sommeVariance += pow((listeNotesDonnee[indexNote]-calculeMoyenne(listeNotesDonnee, listeNotesDonnee.length)),2);  
  }
  float variance = sommeVariance / nombreNotes;
  return variance;
}

//calcul ecart-type
float calculeEcartType(float variance) {
  float ecartType = sqrt(variance);
  return ecartType;
}
