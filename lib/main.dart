import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  void answerQuestion() {
    setState(() {
      questionIndex++;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favourite colour?',
        'answers': ['Black', 'Blue', 'Red', 'Green']
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers': ['Bear', 'Deer', 'Rabbit']
      },
      {
        'questionText': 'Who\'s your favourite Star?',
        'answers': ['Shaq', 'David Bowie', 'Miku']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[questionIndex]['questionText']),
            ...(questions[questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(answerQuestion, answer);
            }).toList()
//        ElevatedButton()
          ],
        ),
      ),
    );
  }
}
