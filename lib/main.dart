import 'package:flutter/material.dart';
import 'package:flutter_quizler/quiz_brain.dart';

void main() {
  runApp(Quizler());
}

QuizBrain quizBrain = QuizBrain();

class Quizler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> listScore = [];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(true);
              },
              color: Colors.green.shade400,
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 21.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(false);
              },
              color: Colors.red.shade400,
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 21.0),
              ),
            ),
          ),
        ),
        Row(
          children: listScore,
        ),
      ],
    );
  }

  void checkAnswer(bool answer) {
    setState(() {
      if (quizBrain.getQuestionAnswer() == answer) {
        listScore.add(
          Icon(
            Icons.check,
            color: Colors.green.shade400,
          ),
        );
      } else {
        listScore.add(
          Icon(
            Icons.close,
            color: Colors.red.shade400,
          ),
        );
      }
      quizBrain.nextQuestion();
    });
  }
}
