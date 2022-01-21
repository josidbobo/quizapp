import 'package:flutter/material.dart';
import './results.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // The Questions and answers list that contains a Map
  final _questions = const [
    {
      'questionText': 'What\'s the name of your principal?',
      'answers': [
        {'text': 'Mr Okonkwo', 'score': 2},
        {'text': 'Mrs Ifesinachi', 'score': 25},
        {'text': 'Mr Gozie', 'score': 10},
        {'text': 'Mrs Onyikansola', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s the name of the governor of our State?',
      'answers': [
        {'text': 'Aminat', 'score': 4},
        {'text': 'Engr Umahi', 'score': 25},
        {'text': 'Naturo', 'score': 10},
        {'text': 'Bat Man', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s the president of Nigeria?',
      'answers': [
        {'text': 'Miss Onyinye', 'score': 2},
        {'text': 'Mr Osibanjo', 'score': 10},
        {'text': 'Maazi Obinna', 'score': 9},
        {'text': 'Mr Buhari', 'score': 25},
      ],
    },
    {
      'questionText': 'What\'s the most popular sport?',
      'answers': [
        {'text': 'PoleVault', 'score': 1},
        {'text': 'Volleyball', 'score': 8},
        {'text': 'Tennis', 'score': 10},
        {'text': 'Football', 'score': 25},
      ],
    },
  ];

  // Declaring a variable to hold the index of the question to be displayed.
  var _questionIndex = 0;
  // Declaring a variable to hold the total score from the quiz questions.
  var _totalScore = 0;

  // Method to reset the quiz after it has finished. It resets the value of
  // _questionIndex and _totalScore to zero before calling _answerQuestion.
  void _resetQuiz(){
    setState((){
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // Method to contain action to be taken by the press of a button.
  void _answerQuestion(int score) {
    // Incrementing the total score by adding all the scores of the answers chosen.
    _totalScore += score;
    // Updating the UI with new questions according to the current questions index.
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(child: Text('Familiarity Quiz')),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Results(resultScore: _totalScore, resetHandler: _resetQuiz),
      ),
    );
  }
}
