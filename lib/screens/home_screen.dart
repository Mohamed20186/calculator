import 'dart:math';
import 'package:calculator/constant.dart';
import 'package:calculator/widgets/custom_elevated_button.dart';
import 'package:calculator/widgets/main_text.dart';
import 'package:calculator/widgets/operation_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String resultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.primaryColor,
        appBar: AppBar(
          backgroundColor: AppConstants.primaryColor,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          actions: const [
            Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            )
          ],
          title: const Center(
            child: MainText(
              title: 'calculator ',
              fontsize: 45,
            ),
          ),
        ),
        body: Column(
          children: [
            OperationScreen(
              title: resultText,
              btnClick: removeLastCharClick,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CustomElevatedButton(
                          title: 'C',
                          backgroundColor:
                              const Color.fromARGB(255, 175, 19, 8),
                          overlayColor: Colors.red,
                          btnClick: onClearClick,
                        ),
                        CustomElevatedButton(
                          title: '√',
                          backgroundColor: AppConstants.fOperationButtonColor,
                          overlayColor: AppConstants.sOperationButtonColor,
                          btnClick: onOperatorclick,
                        ),
                        CustomElevatedButton(
                          title: '^',
                          backgroundColor: AppConstants.fOperationButtonColor,
                          overlayColor: AppConstants.sOperationButtonColor,
                          btnClick: onOperatorclick,
                        ),
                        CustomElevatedButton(
                          title: '/',
                          backgroundColor: AppConstants.fOperationButtonColor,
                          overlayColor: AppConstants.sOperationButtonColor,
                          btnClick: onOperatorclick,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        CustomElevatedButton(
                          title: '7',
                          btnClick: onDigitClick,
                        ),
                        CustomElevatedButton(
                          title: '8',
                          btnClick: onDigitClick,
                        ),
                        CustomElevatedButton(
                          title: '9',
                          btnClick: onDigitClick,
                        ),
                        CustomElevatedButton(
                          title: 'X',
                          backgroundColor: AppConstants.fOperationButtonColor,
                          overlayColor: AppConstants.sOperationButtonColor,
                          btnClick: onOperatorclick,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        CustomElevatedButton(
                          title: '4',
                          btnClick: onDigitClick,
                        ),
                        CustomElevatedButton(
                          title: '5',
                          btnClick: onDigitClick,
                        ),
                        CustomElevatedButton(
                          btnClick: onDigitClick,
                          title: '6',
                        ),
                        CustomElevatedButton(
                          title: '-',
                          backgroundColor: AppConstants.fOperationButtonColor,
                          overlayColor: AppConstants.sOperationButtonColor,
                          btnClick: onOperatorclick,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        CustomElevatedButton(
                          title: '1',
                          btnClick: onDigitClick,
                        ),
                        CustomElevatedButton(
                          title: '2',
                          btnClick: onDigitClick,
                        ),
                        CustomElevatedButton(
                          title: '3',
                          btnClick: onDigitClick,
                        ),
                        CustomElevatedButton(
                          title: '+',
                          backgroundColor: AppConstants.fOperationButtonColor,
                          overlayColor: AppConstants.sOperationButtonColor,
                          btnClick: onOperatorclick,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        CustomElevatedButton(
                          title: '0',
                          btnClick: onDigitClick,
                        ),
                        CustomElevatedButton(
                          title: '.',
                          btnClick: onDigitClick,
                        ),
                        CustomElevatedButton(
                          backgroundColor: AppConstants.fEqualButtonColor,
                          overlayColor: AppConstants.sEqualButtonColor,
                          title: '=',
                          flex: 2,
                          btnClick: onEqualCick,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  void onDigitClick(String btnText) {
    if (btnText == '.') {
      if (!resultText.contains('.')) {
        resultText += btnText;
      }
    } else {
      resultText += btnText;
    }

    setState(() {});
  }

  String savedNumber = '';
  String savedOperator = '';

  void onOperatorclick(String btnText) {
    if (savedNumber.isEmpty) {
      savedNumber = resultText;
      savedOperator = btnText;
      resultText = '';
    } else {
      String newNumber = resultText;
      savedNumber =
          calculate(lhs: savedNumber, operator: savedOperator, rhs: newNumber);
      savedOperator = btnText;
      resultText = '';
    }
    setState(() {});
  }

  String calculate(
      {required String lhs, required String operator, required String rhs}) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    num result = 0;
    switch (operator) {
      case '+':
        result = n1 + n2;
        break;
      case '-':
        result = n1 - n2;
        break;
      case '/':
        result = n1 / n2;
        break;
      case 'X':
        result = n1 * n2;
        break;
      case '^':
        result = pow(n1, n2);
        break;
      case '√':
        result = sqrt(n1);
        break;
    }
    return result.toString();
  }

  void onEqualCick(String btnText) {
    if (savedOperator == '√') {
      var result =
          calculate(lhs: savedNumber, operator: savedOperator, rhs: '0');
      resultText = result;
      savedNumber = '';
      savedOperator = '';
    } else {
      String newNumber = resultText;
      var result =
          calculate(lhs: savedNumber, operator: savedOperator, rhs: newNumber);
      resultText = result;
      savedNumber = '';
      savedOperator = '';
    }
    setState(() {});
  }

  void onClearClick(String btnText) {
    savedNumber = '';
    savedOperator = '';
    resultText = '';
    setState(() {});
  }

  void removeLastCharClick(String str) {
    if (str.isNotEmpty) {
      resultText = resultText.substring(0, resultText.length - 1);
      setState(() {});
    }
  }
}
