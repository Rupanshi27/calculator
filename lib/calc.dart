import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late double num1;
  late double num2;
  late String history;
  late String textToDisplay;
  late String operation;

  void btnOnClick(String btnVal) {
    if (btnVal == 'C') {
      textToDisplay = '';
      num1 = 0;
      num2 = 0;
      history = '';
    } else if (btnVal == '+' || btnVal == '-' || btnVal == '×' || btnVal == '÷') {
      num1 = double.parse(textToDisplay);
      operation = btnVal;
      textToDisplay = '';
      history = '$num1 $operation ';
    } else if (btnVal == '=') {
      num2 = double.parse(textToDisplay);
      if (operation == '+') {
        textToDisplay = (num1 + num2).toString();
      } else if (operation == '-') {
        textToDisplay = (num1 - num2).toString();
      } else if (operation == '×') {
        textToDisplay = (num1 * num2).toString();
      } else if (operation == '÷') {
        if (num2 != 0) {
          textToDisplay = (num1 / num2).toString();
        } else {
          textToDisplay = 'Error';
        }
      }
      history = '$history$num2 = $textToDisplay';
    } else if (btnVal == '±') {
      // Change the sign of the displayed value
      if (textToDisplay.isNotEmpty && textToDisplay != 'Error') {
        if (textToDisplay[0] == '-') {
          textToDisplay = textToDisplay.substring(1); // Remove the negative sign
        } else {
          textToDisplay = '-$textToDisplay'; // Add a negative sign
        }
      }
    } else {
      textToDisplay += btnVal;
    }

    setState(() {
      textToDisplay = textToDisplay;
      history = history;
    });
  }

  @override
  void initState() {
    super.initState();
    num1 = 0;
    num2 = 0;
    history = '';
    textToDisplay = '';
    operation = '';
  }

  Widget buildButton(String buttonText, Color buttonColor, double fontSize) {
    return ElevatedButton(
      onPressed: () {
        btnOnClick(buttonText);
      },
      style: ElevatedButton.styleFrom(
        elevation: 3,
        fixedSize: Size.fromHeight(70),
        backgroundColor: buttonColor,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.calculate_rounded,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Calculator'),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment(1, 1),
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: Text(
                        history,
                        style: TextStyle(fontSize: 24, color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: Text(
                        textToDisplay,
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton('C', Color.fromARGB(255, 168, 168, 168), 25),
                        buildButton('±', Color.fromARGB(255, 168, 168, 168), 35),
                        buildButton('%', Color.fromARGB(255, 168, 168, 168), 30),
                        buildButton('÷', Color.fromARGB(255, 240, 165, 53), 35),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton('7', Color.fromARGB(255, 35, 35, 35), 30),
                        buildButton('8', Color.fromARGB(255, 35, 35, 35), 30),
                        buildButton('9', Color.fromARGB(255, 35, 35, 35), 30),
                        buildButton('×', Color.fromARGB(255, 240, 165, 53), 35),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton('4', Color.fromARGB(255, 35, 35, 35), 30),
                        buildButton('5', Color.fromARGB(255, 35, 35, 35), 30),
                        buildButton('6', Color.fromARGB(255, 35, 35, 35), 30),
                        buildButton('-', Color.fromARGB(255, 240, 165, 53), 35),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton('1', Color.fromARGB(255, 35, 35, 35), 30),
                        buildButton('2', Color.fromARGB(255, 35, 35, 35), 30),
                        buildButton('3', Color.fromARGB(255, 35, 35, 35), 30),
                        buildButton('+', Color.fromARGB(255, 240, 165, 53), 35),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 35, 35, 35),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(37),
                            ),
                            fixedSize: Size(146, 60),
                          ),
                          onPressed: () {
                            btnOnClick('0');
                          },
                          child: const Text(
                            '0           ',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        buildButton('.', Color.fromARGB(255, 35, 35, 35), 30),
                        buildButton('=', Color.fromARGB(255, 240, 165, 53), 40),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}