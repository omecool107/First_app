import 'package:first_app/widgets/chart.dart';
import 'package:first_app/widgets/new_transactions.dart';
import 'package:first_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './models/Transaction.dart';

void main() {
  runApp(MyApp());
  }


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: Colors.amber,
        primarySwatch: Colors.amber,
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
      id: 'T3', 
      title: 'New Boots',
      amount: 77.49,
      date: DateTime.now()
      ),
      Transaction(
      id: 'T4', 
      title: 'New Jacket',
      amount: 42.69,
      date: DateTime.now()
      ),
    Transaction(
      id: 'T5', 
      title: 'New Boots',
      amount: 77.49,
      date: DateTime.now()
      ),
      Transaction(
      id: 'T6', 
      title: 'New Jacket',
      amount: 42.69,
      date: DateTime.now()
      ),
    Transaction(
      id: 'T7', 
      title: 'New Boots',
      amount: 77.49,
      date: DateTime.now()
      ),
      Transaction(
      id: 'T7', 
      title: 'New Jacket',
      amount: 42.69,
      date: DateTime.now()
      ),
    Transaction(
      id: 'T8', 
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
  void addNewTransactions(String title, double amount, DateTime date, double id){
    final newTx = Transaction(
      title: title, 
      amount: amount,
      date: date,
      id: id.toString(),
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
 var showChart = false;

 
  @override
  Widget build(BuildContext context) {  
    var mediaQuery = MediaQuery.of(context); 
    var themeOf = Theme.of(context);
    var appBar = AppBar(        
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
      );
    var trueHeight = 
    (mediaQuery.size.height) - mediaQuery.padding.top - appBar.preferredSize.height;
    var chartContainer = Container(
              height: 
                 mediaQuery.orientation == Orientation.portrait ?  
                (trueHeight * 0.28) : 
                (trueHeight * 0.65),
              child: Chart(recentTransactions)
              ); 
    var listContainer = Container(
              height: 
              usertransactions.length == 0 ?
                Image.asset('assets/images/waiting.png').height : 
                (mediaQuery.orientation == Orientation.portrait ?  
                (trueHeight * 0.72) : 
                (trueHeight * 0.63)) ,
              child: TransactionList(usertransactions, deleteTransaction)
              );
    var switchContainer = Row(              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text('Show Chart',
                  style: themeOf.textTheme.title,),
                  Switch(
                    activeColor: themeOf.primaryColor,
                    value: showChart, 
                    onChanged: (val){
                      setState(() {
                        showChart = val;
                      });
                    },
                    ),
            ],);
    var body = Column(           
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[            
            Container(
              height: 40,
              child: switchContainer),
            ],
        );
    if (mediaQuery.orientation == Orientation.portrait){
      body.children.removeAt(0);
      body.children.add(chartContainer);
      body.children.add(listContainer);
    }else{
      if(showChart){body.children.add(chartContainer);}
      else{body.children.add(listContainer);}      
    }
    
    return Scaffold(
      appBar: appBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeOf.primaryColor,        
        child: Icon(Icons.card_membership),
        onPressed: ()  => startTransactionLog(context),
      ),
      body: SingleChildScrollView(
            child: body,
       ),
       
    );
  }
}
