// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Kalkulator extends StatefulWidget {
  const Kalkulator({Key? key}) : super(key: key);

  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  String result = "";
  String num1 = "";
  String num2 = "";
  String operation = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
        ),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "$num1 $operation $num2",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("*"),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton("0"),
                buildButton("."),
                buildButton("C"),
                buildButton("+"),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton("="),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String text) {
    return InkWell(
      onTap: () {
        setState(() {
          if (text == "C") {
            result = "";
            num1 = "";
            num2 = "";
            operation = "";
          } else if (text == "=") {
            if (num1 != "" && num2 != "") {
              double resultValue = 0.0;
              if (operation == "/") {
                resultValue = double.parse(num1) / double.parse(num2);
              } else if (operation == "*") {
                resultValue = double.parse(num1) * double.parse(num2);
              } else if (operation == "-") {
                resultValue = double.parse(num1) - double.parse(num2);
              } else if (operation == "+") {
                resultValue = double.parse(num1) + double.parse(num2);
              }
              result = resultValue.toString();
              if (resultValue % 1 == 0) {
                result = resultValue.toInt().toString();
              }
              num1 = result;
              num2 = "";
            }
          } else if (text == "/" || text == "*" || text == "-" || text == "+") {
            if (num1 != "") {
              if (num2 != "") {
                // Jika num2 sudah ada, hitung hasilnya terlebih dahulu
                double resultValue = 0.0;
                if (operation == "/") {
                  resultValue = double.parse(num1) / double.parse(num2);
                } else if (operation == "*") {
                  resultValue = double.parse(num1) * double.parse(num2);
                } else if (operation == "-") {
                  resultValue = double.parse(num1) - double.parse(num2);
                } else if (operation == "+") {
                  resultValue = double.parse(num1) + double.parse(num2);
                }
                num1 = resultValue.toString();
                if (resultValue % 1 == 0) {
                  num1 = resultValue.toInt().toString();
                }
                num2 = "";
              }
              operation = text;
            }
          } else {
            if (operation.isEmpty) {
              num1 = (num1 + text).replaceAll(RegExp(r'^0+'), '');
              result = num1;
            } else {
              num2 = (num2 + text).replaceAll(RegExp(r'^0+'), '');
              result = "$num1 $operation $num2";
            }
          }
        });
      },
      child: Container(
        width: 64,
        height: 64,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
