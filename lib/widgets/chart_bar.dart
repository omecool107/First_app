import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double percentSpent;
  ChartBar({this.amountSpent, this.label, this.percentSpent});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,      
      children: [
            FittedBox(
              child: Text('\$${amountSpent.toStringAsFixed(0)}')
              ),
            SizedBox(height: 4,),
            Container(
              height: 60,
              width: 10,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).primaryColor, 
                      width: 1
                      ),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentSpent,
                  child: Container(
                    decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  )
               ],
              ),
            ),
            SizedBox(height: 4,),
            Text(label)
      ],      
    );
  }
}