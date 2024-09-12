import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  const MainText({
    super.key,
    required this.title,
    this.color = Colors.white,
    this.fontsize = 35,
  });
  final String title;
  final Color color;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: AppConstants.mainFont,
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
