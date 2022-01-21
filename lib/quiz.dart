import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

// This manages the state of the questions and answers and what they are to do
// in real time.

class Quiz extends StatelessWidget {
  final List<Map<String,Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.questionIndex,
    @required this.answerQuestion,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      // The question and answer buttons widget.
      children: [
        Question(questions[questionIndex]['questionText']),
        // This is to create a single option one after the other as it is found in the map of
        // of the questions.
        ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer){
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
