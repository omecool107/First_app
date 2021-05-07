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
    var mediaQuery = MediaQuery.of(context);
    var trans = List.generate(transactions.length, (index) => 
                  Card(
                    elevation: 6,          
                    child: ListTile(
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.title,
                        ),
                      leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          radius: 25, 
                          child: FittedBox(child: Text('\$${transactions[index].amount.toStringAsFixed(2)}')),
                        ),
                      subtitle: Text(DateFormat.yMMMMEEEEd().format(transactions[index].date),
                                     style: TextStyle(fontSize: 12, color: Colors.grey)
                                     ),
                      trailing: mediaQuery.size.width < 400 ?
                                (IconButton(
                                  color: Colors.red,
                                  icon: Icon(Icons.delete_outline), 
                                  onPressed: () => delete(transactions[index].id),
                                ))
                                : (  FlatButton.icon(
    textColor: Colors.red,
    icon: Icon(Icons.delete_outline),
    onPressed: () => delete(transactions[index].id),
    label: Text('Delete')
  )),
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
     else {
       return SingleChildScrollView(child: Column(children: trans));
      }
  }
}

