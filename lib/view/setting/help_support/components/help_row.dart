import 'package:flutter/material.dart';

class HelpSupportRow extends StatelessWidget {
  const HelpSupportRow({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: TextStyle(
            color: Colors.black,
            fontSize: 13
        ),),
        Icon(Icons.navigate_next_outlined,
          color: Colors.grey,)
      ],
    );
  }
}

