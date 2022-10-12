import 'package:flutter/material.dart';
import 'package:guessing_game/game_controller/guess_compare.dart';
import 'package:guessing_game/game_controller/question_list.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

String tempWord = "temp";
int  knowingLetterCount = 0;
int i = 0;
String hinttext = "some hint !" ;
String knowingtext = "some knowing!";
List<String> playerGuesses = [];

class _GameViewState extends State<GameView> {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myController.dispose();
      super.dispose();
    }

    return Scaffold(body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(hinttext),
        Text(knowingtext),
      TextField(controller: myController),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextButton(onPressed: (){
          guessButtonClick(myController.text);
        }, child: Text("guess")),
        TextButton(onPressed: (){
          nextButtonClick();
          },
            child: Text("next")),
      ],),
    ],),),);

  }

  guessButtonClick(String textfieldText){
    String word = textfieldText;
    List<String> words = word.split("");
    for (int i = 0; i < word.length; i++) {
      playerGuesses.add(words[i]);
    }
    knowingLetterCount = GuessCompare.compare(tempWord,playerGuesses);

    setState(() {
      knowingtext = ("you know the $knowingLetterCount letter try more!");
    });
    GuessCompare.correctLetterCounter = 0;
    if (textfieldText == tempWord){

      setState(() {
        knowingtext = "you won !";
      });

    }
    print("you know the $knowingLetterCount letter try more!");
  }

  nextButtonClick(){
    // print(QuestionList().getQuestionList()[0].a.toString());
    // print("mla");
     hinttext = QuestionList().getQuestionList()[i].b.toString();
    //hintLabel.setText(QuestionsList.animalQuestions.get(i).getValue1().toString());
    //for (int i=0; i<WordList.words.size(); i++ ){}
    tempWord = QuestionList().getQuestionList()[i].a.toString();
    int lenght = tempWord.length;
    //tempWord = wordGenerator.generateWord();
     setState(() {
       knowingtext = "your word have $lenght letters";
     });
    print(tempWord);
    if (i+1 == QuestionList().getQuestionList().length){
      i=0;
    }
    i++;

  }
}
