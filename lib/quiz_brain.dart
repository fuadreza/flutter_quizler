import 'question.dart';

class QuizBrain {

  int _questionNumber = 0;

  List<Question> _questions = [
    Question('A cow has 4 feets but cat only have 2 feets', false),
    Question('Approximataely one quarter of human bones are in the feet', true),
    Question('A slug\'s blood is green', false),
    Question('Earth only has 1 moon', true),
  ];

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer(){
    return _questions[_questionNumber].questionAnswer;
  }

  int getLength(){
    return _questions.length;
  }

  void nextQuestion(){
    if(_questionNumber>=_questions.length - 1){
      _questionNumber = 0;
    }else {
      _questionNumber++;
    }
  }

}
