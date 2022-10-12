import 'package:guessing_game/game_controller/pair.dart';

class QuestionList{

    final List<Pair> questionList = [
    Pair("elephant", "Biggest land animal in the world"),
    Pair("bee","they are make colony and manifacturing"),
    Pair("snake","if you see this animal , you would scared"),
    Pair("bear","in Russia this animal get respected"),
    Pair("cat","this is a pet ")
  ];

  List<Pair> getQuestionList(){
    return questionList;
  }

}