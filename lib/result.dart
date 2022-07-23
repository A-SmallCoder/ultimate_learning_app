import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Result extends StatelessWidget {

  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore,this.resetHandler);

  String get resultPhrase{
    var res='You did it!';
    if (resultScore <= 6){
      res = 'You scored 6 or less';
    }else if(resultScore <= 12){
      res = 'You scored 12 or less';
    }else{
      res = 'you did great';
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('Your score is $resultScore. $resultPhrase',
            style: TextStyle(fontSize: 36,
            fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(child: Text('Restart Quiz'), onPressed: resetHandler)
          ],
      )
      
      
      );
  }
}
