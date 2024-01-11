
import 'package:flutter/material.dart';

class CbbSectionImage extends StatelessWidget {
  const CbbSectionImage({
    super.key, required this.title,
    required this.image, this.onTap});
  final String title;
  final String image;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(image,fit: BoxFit.cover,

          ),
          const SizedBox(height: 10,),
          Text(title,style: const TextStyle(color:
          Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15
          ),)
        ],
      ),
    );
  }
}