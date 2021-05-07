import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double percentSpent;
  ChartBar({this.amountSpent, this.label, this.percentSpent});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constranit) {
      var maxHeight = constranit.maxHeight;
      return Column(
      crossAxisAlignment: CrossAxisAlignment.center,      
      children: [
            Container(
              height: maxHeight*0.15,
              child: FittedBox(
                child: Text('\$${amountSpent.toStringAsFixed(0)}')
                ),
            ),
            SizedBox(height: maxHeight*0.05,),
            Container(
              height: maxHeight*0.6,
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
            SizedBox(height: maxHeight*0.05,),
            Container(
              height: maxHeight*0.15,
              child: Text(label
              ))
        ],      
      );
    }) ;
  }
}