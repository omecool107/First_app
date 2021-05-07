import 'package:intl/intl.dart';
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
  DateTime selectecDate;
  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    
    if(enteredTitle.isEmpty||enteredAmount <= 0){
      
      return;
    } 

    widget.newTx(
        enteredTitle, 
        enteredAmount,
        selectecDate,
        enteredAmount*(selectecDate.day.toDouble())*(DateTime.now().microsecond.toDouble()),
    );    
    Navigator.of(context).pop();
  }
  void presentDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2021), 
      lastDate: DateTime.now()).then((pickedDate) {
        if (pickedDate == null){
          return;
        }
        setState(() {
          selectecDate = pickedDate;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
            child:Card(
            elevation: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: mediaQuery.viewInsets.bottom + 10,
                ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selectecDate == null ? 
                      'No Date Has Been Chosen' :  
                      DateFormat.yMMMMEEEEd().format(selectecDate),
                      style: Theme.of(context).textTheme.title,
                      ),
                  ),
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
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: OutlinedButton(
                        style: TextButton.styleFrom(
                        primary: Colors.purple,
                        side: BorderSide(color: Colors.purple),),
                            child: Text('Choose Date'), 
                            onPressed: presentDatePicker,
                      )
                  ,),
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