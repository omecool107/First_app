import 'package:first_app/models/Transaction.dart';
import 'package:first_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Chart extends StatelessWidget {
  final List<Transaction> recentTransactons;
  Chart(this.recentTransactons);
  List<Map<String,Object>> get groupTransactionsValues{
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for(var i = 0; i < recentTransactons.length; i++){
        if(recentTransactons[i].date.day == weekDay.day &&
           recentTransactons[i].date.month == weekDay.month &&
           recentTransactons[i].date.year == weekDay.year
           ){
             totalSum += recentTransactons[i].amount;
           }
      }
      return{'day': DateFormat.E().format(weekDay).substring(0,1), 'amount': totalSum};
    }).reversed.toList();
  }

  double get maxWeekSpending{
    return groupTransactionsValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context); 
    return Card(
      elevation: 6,
      margin: EdgeInsets.only(
        top: mediaQuery.orientation == Orientation.portrait ? 15 : 0,
        left: mediaQuery.orientation == Orientation.portrait ? 15 : 100,
        right: mediaQuery.orientation == Orientation.portrait ? 15 : 100,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: groupTransactionsValues.map((data){
          //return Text('${data['day']} : ${data['amount']}');
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              amountSpent: data['amount'],
              label: data['day'],
              percentSpent: maxWeekSpending == 0.0 ? 0.0 : (data['amount'] as double)/maxWeekSpending,
              ),
          );
        }).toList(),
      ),
    );
  }
}