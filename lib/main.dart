import 'package:flutter/material.dart';
import './question.dart';

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
     'What\'s your favourite colour?',
     'What\'s your favourite animal?'
     ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questions[questionIndex]
              ),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: answerQuestion,
            ),
//        ElevatedButton()
          ],
        ),
      ),
    );
  }
}
