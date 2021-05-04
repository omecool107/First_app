import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  final Function newTx;
  NewTransactions(this.newTx);
  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    
    if(enteredTitle.isEmpty||enteredAmount <= 0){
      
      return;
    } 
    print(enteredTitle);
    print(enteredAmount);
    widget.newTx(
        enteredTitle, 
        enteredAmount,
    );    
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            child:Card(
            elevation: 0,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: titleController,                    
                    decoration: InputDecoration(labelText: 'Title'),
                    onSubmitted: (_) => submitData(),
                    ),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => submitData(),
                    decoration: InputDecoration(labelText: 'Amount'),
                    ),
                  OutlinedButton(
                    style: TextButton.styleFrom(
                    primary: Colors.green,
                    side: BorderSide(color: Colors.green),),
                    onPressed: submitData, 
                    child: Text('Add Transaction')
                  ),
                ]
              ),
            ),
          )
        );
  }
}