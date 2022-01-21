import 'package:flutter/material.dart';

// This is the Answer button's widget that describes he properties.
class Answer extends StatelessWidget {

  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ElevatedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            backgroundColor: MaterialStateProperty.all(Colors.amber),
            overlayColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.hovered))
                        return Colors.red;
                      if(states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return Colors.blue;
                      return null;
                      },
                    ),
                  ),
          child: Text(
            answerText,
            style: TextStyle(fontSize: 19, color: Colors.purple,),
          ),
          onPressed: selectHandler,
      ),
    );
  }
}
