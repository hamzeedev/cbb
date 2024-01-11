import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({super.key, required this.questionNo});
  final String questionNo;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.black87.withOpacity(.7)
          )
      ),
      child: Row(
        children: [
          Text(questionNo,style: TextStyle(
              color: Colors.grey
          ),),
          SizedBox(width: 5,),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 1,
                margin: EdgeInsets.only(bottom: 10),
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(width: 10,),
          Icon(Icons.navigate_next_rounded,color: Colors.grey,)
        ],
      ),
    );
  }
}