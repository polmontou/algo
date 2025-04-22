void setup() {
  //compteur caractères
  //println("Il y a "+compteurChar(phrase)+" caractère"+(compteurChar(phrase) > 1 ? "s" :"")+" en comptant les espaces avant le \".\".");
  
  //compteur lettre
  //char lettreACompter = 's';
  //println("Il y a "+compteurLettre(phrase, lettreACompter)+" fois la lettre \""+lettreACompter+"\" dans ma phrase.");
  
  //test palindrome
  println(texte);
  println("Cette phrase est un palindrome : "+ (testPalindrome(phrase) ? "vrai":"faux")+".");
  
  println(texte+" est codé en : "+crypter(phrase));
}

String texte = "IL FAIT BEAU.";
char[] phrase = texte.toCharArray();


//retire les espaces de ma phrase
char[] enleveEspace(char[] phrase) {
  
  //compte combien de caractère ne sont pas des espaces
  int nonRetires = 0;
  for (int indexLettre = 0; indexLettre < phrase.length; indexLettre++) {
    if (phrase[indexLettre] != ' ') {
      nonRetires ++;
    }
  }
  //crée une liste intermédiaire de la longueur du nombres de caractères qui ne sont pas des espaces
  char[] phraseSansEspace = new char[nonRetires];
  int x = 0;
  //remplace la valeur de chacune des entrées de cette liste intermédiaire par les lettres de ma liste initiale
  for (int indexLettreBis = 0; indexLettreBis < phrase.length; indexLettreBis++) {
    if(phrase[indexLettreBis] != ' ') {
      phraseSansEspace[x]=phrase[indexLettreBis];
      x++;
    }
  }

  return phraseSansEspace;
}

//compte le nombre de caractères dans une phrase avant le '.'
int compteurChar(char[] phrase) {
  int compteur = 0;
  int index = 0;
  while (phrase[index] != '.') {
    compteur ++;
    index ++;
  }
  return compteur;
}

int compteurLettre(char[] phrase, char letter) {
  int compteurOccurence = 0;
  for(int indexLettre = 0; indexLettre < phrase.length; indexLettre++) {
    if (phrase[indexLettre] == letter) {
      compteurOccurence++;
    }
  }
  return compteurOccurence;
}

boolean testPalindrome (char[] phrase) {
  boolean palindrome = true;
  char[] sansEspace = enleveEspace(phrase);
  for (int indexLettre = 0; indexLettre < (sansEspace.length-(sansEspace[sansEspace.length-1] == '.' ? 1 : 0))/2; indexLettre++) {
    //println(indexLettre+" vs "+((sansEspace.length-(sansEspace[sansEspace.length-1] == '.' ? 1 : 0))-indexLettre-1));
    //println(sansEspace[indexLettre]+" "+sansEspace[(sansEspace.length-(sansEspace[sansEspace.length-1] == '.' ? 1 : 0))-indexLettre-1]);
    if (sansEspace[indexLettre] != sansEspace[(sansEspace.length-(sansEspace[sansEspace.length-1] == '.' ? 1 : 0))-1-indexLettre]) {
      palindrome = false;
    }
  }
  return palindrome;
}

String crypter (char[] phrase) {
  String phraseCodee = "";
  for(int indexLettre = 0; indexLettre < phrase.length; indexLettre++) {
    if (phrase[indexLettre] == ' ' || phrase[indexLettre] == '.') {
      phraseCodee += phrase[indexLettre];
    } else {
      phraseCodee += crypterCar(phrase[indexLettre]);    
    }
  }
  return phraseCodee;
}

char crypterCar(char lettreACoder) {
  int codeAsciiBase = int(lettreACoder);
  int codeAsciiCode = 0;
  if (codeAsciiBase + 5 > 90) {
    codeAsciiCode = 44 + (codeAsciiBase + 5 - 90);
  } else {
    codeAsciiCode = codeAsciiBase + 5;
  }
  return (char(codeAsciiCode));
}
