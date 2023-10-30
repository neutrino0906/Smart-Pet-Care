// import 'dart:html';
import 'lists.dart';
import 'package:flutter/material.dart';
class Ques extends StatefulWidget {
  const Ques({Key? key}) : super(key: key);
  String getRoute() => "QuesScreen";
  @override
  State<Ques> createState() => _QuesState();
}

class _QuesState extends State<Ques> {
  double quesNo=0;
  bool y_n=false;
  @override
  Widget build(BuildContext context) {
    Lists lists=Lists();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LinearProgressIndicator(
            value: quesNo,
            color: Colors.lightGreenAccent,
          ),
          Text(lists.questions[quesNo.toInt()]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()=>{
                y_n=true
              },
                  child: Text(
                    'Yes'
                  ),
              ),
              ElevatedButton(onPressed: (){},
                child: Text(
                    'No'
                ),
              ),
            ],
          ),
          TextButton(onPressed: (){},
              child: Text('Dont know')
          ),
          ElevatedButton(onPressed: (){
            if(y_n==true) lists.scores[quesNo.toInt()]=1;
              quesNo++;
            },
              child:Text('Next')
          )
        ],
      ),
    );
  }
}