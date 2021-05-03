import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
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
   final _questions = const [
    {
      'questionText': 'What\'s your eye colour?',
      'answers': [
        {'text': 'Yellow', 'score': 6}, 
        {'text': 'Blue', 'score': 2}, 
        {'text': 'Orange', 'score': 9}, 
        {'text': 'White', 'score': 1}, 
        {'text': 'Black', 'score': 3}, 
        {'text': 'Pink', 'score': 7},
        {'text': 'Purple', 'score': 8},
        {'text': 'Red', 'score': 4},
        {'text': 'Brown', 'score': 5},
        ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Bear', 'score': 7}, 
        {'text': 'Deer', 'score': 17},
        {'text': 'Rabbit', 'score': 1}, 
        {'text': 'Tiger', 'score': 2}, 
        {'text': 'Fox', 'score': 9},
        {'text': 'Horse', 'score': 6},
        {'text': 'Lion', 'score': 3},
        {'text': 'Wolf', 'score': 4},
        {'text': 'Snake', 'score': 29},
        {'text': 'Slug', 'score': 36},
        {'text': 'Toad', 'score': 14},
        {'text': 'Squid', 'score': 5},
        {'text': 'Dragon', 'score': 26},
        ]
    },
    {
      'questionText': 'Who\'s your favourite Symbol?',
      'answers': [
        {'text': 'Heart', 'score': 7}, 
        {'text': 'Leaf', 'score': 9}, 
        {'text': 'Cloud', 'score': 10},
        {'text': 'Note', 'score': 8},
        ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void restart(){
     setState(() {
    _questionIndex = 0;
    _totalScore = 0;
    });
  }

  void answerQuestion(int score) {

    _totalScore += score;

    if (_questionIndex < (_questions.length)) {
      setState(() {
        _questionIndex++;
      });
    } else {
      setState(() {
        _questionIndex = 0;
      });
    }
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: (_questionIndex < (_questions.length))
            ? Quiz(answerQuestion: answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions)
            : Result(_totalScore, restart),
      ),
    );
  }
}
