int nombreErreur = 10;

void setup() {
  String pleinDeMots = "coucou petite chaussette tomate orange jambon orange palindrome chalet belledonne chartreuse vanoise handball piscine waterpolo badminton chocolat";
  String motATrouver = motATrouver(pleinDeMots);
  char[] wordToFind = conversionMotATrouver(motATrouver);
  char[] motAAfficher = motAAfficher(wordToFind);
  while (nombreErreur>0 && !testEgalite(wordToFind, motAAfficher))  {
    derouleJeu(wordToFind, motAAfficher);
  }
  if (nombreErreur == 0) {
    println("\nC'est perdu, plus de tentative restante!");
  } else if (testEgalite(wordToFind, motAAfficher)) {
    affichageMot(motAAfficher);
    println("\nFélicitations! Vous avez trouvé le mot!");
  }
}

String motATrouver (String pleinDeMots) {
  String[] listeMots = split(pleinDeMots,' ');
  int numeroHasard = int(random(0,listeMots.length));
  return listeMots[numeroHasard];
}

void derouleJeu(char[] wordToFind, char[] motAAfficher) {
  affichageMot(motAAfficher);
  testLettre(wordToFind, motAAfficher);
}

char[] conversionMotATrouver(String motATrouver) {
  char[] wordToFind = motATrouver.toCharArray();
  return wordToFind;
}

char[] motAAfficher(char[] wordToFind) {
  char[] motAAfficher = {};
  for (int i=0; i < wordToFind.length; i++) {
    motAAfficher = append(motAAfficher, '_');
  }
  return motAAfficher;
}

void affichageMot(char[] motAAfficher) {
  println("\nLe mot à afficher est : ");
  for (int i=0; i<motAAfficher.length; i++) {
    print(motAAfficher[i]);
  }
}

void testLettre (char[] wordToFind, char[] motAAfficher) {
  char lettreTestee = javax.swing.JOptionPane.showInputDialog(null, "Tapez une lettre :").charAt(0);
  boolean test = false;
  for (int i=0; i<motAAfficher.length; i++) {
    if (lettreTestee == wordToFind[i]) {
      motAAfficher[i] = lettreTestee;
      test = true;
    }
  }
  if (!test) {
    nombreErreur--;
    println("\n"+lettreTestee+" n'est pas dans le mot à trouver");
    println("Il te reste "+nombreErreur+" tentatives.");
  }
}

boolean testEgalite (char[] wordToFind, char[] motAAfficher) {
  boolean testEgalite = true;
  for (int i=0; i<wordToFind.length; i++) {
    if (wordToFind[i] != motAAfficher[i]) {
      testEgalite = false;
    }
  }
  return testEgalite;
}
