import 'package:flutter/material.dart';

// This manages the result displayed after the test.

class Results extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Results({
    @required this.resultScore,
    @required this.resetHandler
  });

  String get resultPhrase {
    String resultText;
    if (resultScore <= 20){
      resultText = 'Nice shot, you did well to get this far';
    }
    else if(resultScore <= 40){
      resultText = 'Pretty impressive';
    }
    else if(resultScore <= 50){
      resultText = 'You are doing well!';
    }
    else{
        resultText = 'You no go like abandon this competition? '
            'you don pass this one boss!' ;
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$resultScore%',
              style: TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
              textAlign: TextAlign.center,
          ),
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.green),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Restart Quiz', style: TextStyle(fontSize: 19)),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.blue),
              overlayColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed) ||
                    states.contains(MaterialState.focused))
                  return Colors.red;
                if (states.contains(MaterialState.hovered))
                  return Colors.amber;
                return null;
              }),
            ),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
