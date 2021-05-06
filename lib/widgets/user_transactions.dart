import 'package:flutter/material.dart';
//import 'package:first_app/widgets/new_transactions.dart';
//import 'package:first_app/widgets/transaction_list.dart';
import '../models/Transaction.dart';
class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> usertransactions= [
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

  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//Column(
 //           children: [
 //             NewTransactions(addNewTransactions),
 //             TransactionList(usertransactions),
 //     ],
 //   );