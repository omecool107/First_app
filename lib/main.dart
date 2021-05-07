import 'package:first_app/widgets/chart.dart';
import 'package:first_app/widgets/new_transactions.dart';
import 'package:first_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/Transaction.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: Colors.amber,
        brightness: Brightness.dark,
        cardTheme: CardTheme(color: Colors.black),
        fontFamily: 'Quicksand',
        textTheme: TextTheme(title: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),     
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    final List<Transaction> usertransactions = [
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
  List<Transaction> get recentTransactions{
    return usertransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7)
          )
        );
    }).toList();
  }
  void addNewTransactions(String title, double amount){
    final newTx = Transaction(
      title: title, 
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString()
      );
    setState((){
      usertransactions.add(newTx);
    });
  }
  void startTransactionLog(BuildContext ctx){
    showModalBottomSheet(
      context: ctx, 
      builder: (_) {return NewTransactions(addNewTransactions); },
      );
  }

  void deleteTransaction(String id){
    setState(() {
      usertransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(        
        title: Text('New Flutter App', 
        style: TextStyle(color: Colors.black,
        fontWeight: FontWeight.bold, 
        ),),
        actions: [
          IconButton(           
            icon: Icon(Icons.add, color: Colors.black,), 
            onPressed: ()  => startTransactionLog(context),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,        
        child: Icon(Icons.card_membership),
        onPressed: ()  => startTransactionLog(context),
      ),
      body: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            Chart(recentTransactions),
 //         NewTransactions(addNewTransactions),
            TransactionList(usertransactions, deleteTransaction),
            ],
        ),
       ),
       
    );
  }
}
