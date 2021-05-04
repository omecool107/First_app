import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      ),
                    ),
                  TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                      labelText: 'Amount',                      
                      ),
                    ),
                  OutlinedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.green,
                      side: BorderSide(color: Colors.green),
                      ),
                    onPressed: (){}, 
                    child: Text('Add Transaction')
                    ),
                ]
              ),
            ),
          );
  }
}