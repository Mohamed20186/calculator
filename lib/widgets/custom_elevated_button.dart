import 'package:calculator/constant.dart';
import 'package:calculator/widgets/main_text.dart';
import 'package:flutter/material.dart';

typedef onDigitClick = void Function(String);

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    this.backgroundColor = AppConstants.secodlyColor,
    this.overlayColor = const Color.fromARGB(255, 138, 137, 137),
    this.title = '1',
    this.flex = 1,
    required this.btnClick,
  });
  final Color backgroundColor;
  final Color overlayColor;
  final String title;
  final onDigitClick btnClick;
  final int flex;

  double circularBorder = 90;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 2, 2, 2), width: 1),
                borderRadius: BorderRadius.circular(circularBorder),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 134, 131, 131),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ]),
            height: 80,
            child: ElevatedButton(
              onPressed: () {
                btnClick(title);
              },
              style: ButtonStyle(
                elevation: WidgetStateProperty.all<double>(5.0),
                backgroundColor:
                    WidgetStateProperty.all<Color>(backgroundColor),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(circularBorder),
                  ),
                ),
                overlayColor: WidgetStateProperty.all<Color>(overlayColor),
                shadowColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              child: MainText(title: title),
            ),
          ),
        ));
  }
}
