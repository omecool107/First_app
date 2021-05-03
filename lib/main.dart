import 'package:first_app/Transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions= [
    Transaction(
      id: 'T1', 
      title: 'New Jacket',
      amount: 42.69,
      date: DateTime.now()
      ),
    Transaction(
      id: 'T2', 
      title: 'New Boots',
      amount: 77.49,
      date: DateTime.now()
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Flutter App'),
      ),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            color: Colors.blue,
            child: Container(
 //             width: double.infinity,
 //             alignment: Alignment.center,
              child: Text('Chart')
              ),
            elevation: 5,
          ),
          Card(
            color: Colors.pink,
            child: Text('List'),
          ),
        ],
      ),
    );
  }
}
