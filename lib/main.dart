import 'package:flutter/material.dart';
import 'package:ultimate_learning_project/quiz.dart';
import 'package:ultimate_learning_project/result.dart';
import 'answer.dart';
import 'question.dart';

//import './question.dart.';

void main(List<String> args) {
  runApp(UltimateApp());
}

class UltimateApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UltimateAppState();
  }
}

class _UltimateAppState extends State<UltimateApp> {
  final questions = const [
    {
      'questionText': 'what\'s your fave color?',
      'answers': [
        {'text': 'red', 'score': 5},
        {'text': 'yellow', 'score': 2},
        {'text': 'blue', 'score': 4},
        {'text': 'green', 'score': 3},
      ],
    },
    {
      'questionText': 'what\'s your fave letter?',
      'answers': [
        {'text': 'A', 'score': 1},
        {'text': 'B', 'score': 2},
        {'text': 'C', 'score': 3},
        {'text': 'D', 'score': 4},
      ],
    },
    {
      'questionText': 'who\'s your fave person?',
      'answers': [
        {'text': 'Me', 'score': 1},
        {'text': 'Yourself', 'score': 5},
        {'text': 'Wifey', 'score': 10},
        {'text': 'Shitty', 'score': 3},
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex =0;
      _totalScore =0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
    });

    _totalScore += score;

    if (_questionIndex < questions.length) {
      print('We have more questions');
    }

    print('Answer chosen');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Ultimate app'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                answerQuestion: ()=>_answerQuestion(_questionIndex),
                questions: questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
