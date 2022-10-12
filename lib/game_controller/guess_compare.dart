import 'dart:core';

class GuessCompare {

  static int correctLetterCounter=0;

   static int compare(String randomWord,List<String> playerGuesses){
     List<String> word = randomWord.split("");
    for (int i = 0; i < randomWord.length; i++) {
      if ( playerGuesses.contains(word[i])){
        ++correctLetterCounter;
      }
    }

    return correctLetterCounter;
  }

/*
    public boolean getResult(String word, String playerGuess){
        if (word.equals(playerGuess)){
            return true;
        }
        return false;
    }

    */

}