import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numBtn(String btnText, Color txtColor, Color btnColor) {
    return ElevatedButton(
      onPressed: () => {calculate(btnText)},
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 24,
          color: txtColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        primary: btnColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numBtn("C", Colors.black, Colors.grey),
                numBtn("+/-", Colors.black, Colors.grey),
                numBtn("%", Colors.black, Colors.grey),
                numBtn("/", Colors.white, Colors.orange),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numBtn("7", Colors.black, Colors.grey),
                numBtn("8", Colors.black, Colors.grey),
                numBtn("9", Colors.black, Colors.grey),
                numBtn("x", Colors.white, Colors.orange),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numBtn("4", Colors.black, Colors.grey),
                numBtn("5", Colors.black, Colors.grey),
                numBtn("6", Colors.black, Colors.grey),
                numBtn("-", Colors.white, Colors.orange),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numBtn("1", Colors.black, Colors.grey),
                numBtn("2", Colors.black, Colors.grey),
                numBtn("3", Colors.black, Colors.grey),
                numBtn("+", Colors.white, Colors.orange),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28, 20, 70, 12),
                    child: Text(
                      "0",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.grey[850]),
                ),
                numBtn('.', Colors.black, Colors.grey),
                numBtn('=', Colors.white, Colors.orange)
              ],
            ),
          ],
        ),
      ),
    );
  }

  //logic part

  int firstNum = 0;
  int secondNum = 0;
  String result = "";
  String text = "";
  String operation = "";

  void calculate(String btnText) {
    if (btnText == "C") {
      result = "";
      text = "";
      firstNum = 0;
      secondNum = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      firstNum = int.parse(text);
      result = "";
      operation = btnText;
    } else if (btnText == "=") {
      secondNum = int.parse(text);
      if (operation == "+") {
        result = (firstNum + secondNum).toString();
      }
      if (operation == "-") {
        result = (firstNum - secondNum).toString();
      }

      if (operation == "x") {
        result = (firstNum * secondNum).toString();
      }
      if (operation == "/") {
        result = (firstNum / secondNum).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }
    setState(() {
      text = result;
    });
  }
}
