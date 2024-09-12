import 'package:calculator/widgets/main_text.dart';
import 'package:flutter/material.dart';

typedef RemoveLastCharClick = Function(String);

class OperationScreen extends StatelessWidget {
  const OperationScreen({
    super.key,
    required this.title,
    required this.btnClick,
  });
  final String title;
  final RemoveLastCharClick btnClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 233, 226, 226),
              spreadRadius: 3,
              blurRadius: 10,
            ),
          ],
          border: Border.all(
            color: const Color.fromARGB(255, 105, 103, 103),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 247, 246, 246).withOpacity(0.3),
        ),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 230,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            MainText(
              title: title,
              color: Colors.white,
              fontsize: 50,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                color: Colors.white,
                onPressed: () {
                  btnClick(title);
                },
                icon: const Icon(
                  Icons.backspace,
                  size: 32,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
