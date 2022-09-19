import 'package:quiz_app/questions.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question("Some Cats are actually allergic to humans.", true),
    Question("You can lead a cow down stairs but not up stair.", false),
    Question("A slug\'s Blood is green.", true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\". ', true),
    Question('It is illegal to pee in the ocean in Portugal.', true)
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAns() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
