import 'package:flutter/material.dart';

class SearchContentField extends StatelessWidget {
  const SearchContentField({super.key,required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.sizeOf(context);
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
      ),
      child: Container(
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: 20),
        width:size.width/1.2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)
        ),
        child: TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onChanged: (value) => controller.text=value,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search,color: Colors.blue,),
              contentPadding: EdgeInsets.only(top: 8),
              hintText: 'Search for content',
              hintStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 12
              )
          ),
        ),
      ),
    );
  }
}