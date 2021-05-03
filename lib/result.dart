import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function reset;
  String go = 'See More';
  Result(this.resultScore, this.reset);
  String get resultPhrse{
  var resultText = 'Welcome Home ';
  switch(resultScore) {
      case (2+9+9): {resultText += "Naruto";} 
      break; 
      case (6+7+7): {resultText += "Nana";} 
      break;
      case (7+7+7): {resultText += "Hana";} 
      break;
      case (1+1+7): {resultText += "Haku";} 
      break;
      case (2+5+9): {resultText += "Haru";} 
      break;
      case (6+6+10): {resultText += "Hiro";} 
      break;
      case (8+6+10): {resultText += "Shiro";} 
      break; 
      case (2+4+9): {resultText += "Akio";} 
      break;
      case (2+2+10): {resultText += "Mikoto";} 
      break; 
      case (2+3+9): {resultText += "Mimi";} 
      break;   
      case (9+26+9): {resultText += "Sumi";} 
      break;
      case (2+1+7): {resultText += "Kiki";} 
      break;
      case (9+9+9): {resultText += "Kurama";} 
      break;
      case (2+2+10): {resultText += "Matatabi";} 
      break;
      case (6+29+8): {resultText += "Izumi";} 
      break;
      case (3+29+8): {resultText += "Kin";} 
      break;
      case (5+36+9): {resultText += "Tsunade";} 
      break;
      case (1+5+9): {resultText += "Hinabi";} 
      break; 
      default: { resultText = "You\'re not Family"; go = 'Get Out';} 
      break; 
   } 
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrse,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: reset, child: Text(go)),
        ],
      ),
    );
  }
}
