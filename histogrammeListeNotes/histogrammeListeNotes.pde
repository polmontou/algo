void setup() {
  float[] notes = {0, 13.5, 8.5, 13.7, 20, 12, 8.5, 17, 11, 10, 9.5, 4, 14, 13.5, 12, 1, 15, 10.5, 7.5, 9.5};
  affichageHisto(0, 20, notes);
}
String etoileHorizontale (int min, int max, float[] notes) {
  String etoile = "";
  for (int indexNote = 0; indexNote < notes.length; indexNote ++) {
    if (((min == 0 && notes[indexNote] >= min)||(min != 0 && notes[indexNote] > min))&& notes[indexNote] <= max) {
      etoile += ("*\t");
    }
  }
  etoile += "\n";
  return etoile;
}
void affichageHisto (int noteMin, int noteMax, float[] notes) {
  for (int x = noteMin; x < noteMax; x += 2) {
    String result = ((x==0 ? "[" : "]")+(x < 10 ? "  ":" ")+x+" ;"+((x+2) < 10 ? "  ":" ")+(x+2)+" ] :" );
    print(result, etoileHorizontale(x, x+2, notes));
  }
}
