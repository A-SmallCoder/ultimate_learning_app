import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final VoidCallback answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  const Quiz({
    required this.answerQuestion,
    required this.questions,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        Text(
          questionIndex.toString(),
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((e) {
          return Answer(() => answerQuestion(), e['text'] as String);
        }).toList()
      ],
    );
  }
}
