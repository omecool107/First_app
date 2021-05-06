import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../models/Transaction.dart';
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delete;
  TransactionList(this.transactions, this.delete);

  @override
  Widget build(BuildContext context) {
    var trans = List.generate(transactions.length, (index) => 
              Card(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Container(                    
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${transactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                        ),
                    ),
                    // ListTile(
                    //     //title: Text(transactions[index].title),
                    //     leading: CircleAvatar(
                    //       radius: 20, 
                    //       child: Text('\$${transactions[index].amount.toStringAsFixed(2)}'),
                    //       ),
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text(
                        transactions[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMMEEEEd().format(transactions[index].date),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ]),
                   Container(                  
                    child: IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.delete_outline), 
                            onPressed: () => delete(transactions[index].id),
                          ),
                   ), 
                  ],),
                ),
              ),
            );
     if (transactions.length == 0) {
       return Column(children:[
         Text(
           'No Transactions added', 
           style: Theme.of(context).textTheme.title,
           ),
          Image.asset('assets/images/waiting.png'),
       ]);
       } 
     else {return Column(children: trans,);}
  }
}

