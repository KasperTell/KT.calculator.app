import 'package:flutter/material.dart';

final GlobalKey<_DisplayState> displayKey = GlobalKey<_DisplayState>();

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Calculator", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Display(key: displayKey),
          Expanded(
            child: ButtonGrid(updateDisplay: () {
              displayKey.currentState?.updateDisplay();
            }),
          ),
        ],
      ),
    );
  }
}

final display = [];

class Display extends StatefulWidget {
  final Key key;

  Display({required this.key}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        display.isEmpty ? "0" : display.join(),
        style: TextStyle(color: Colors.white, fontSize: 50.0),
      ),
    );
  }

  // Add a method to update the display
  void updateDisplay() {
    setState(() {}); // Empty setState to trigger a rebuild
  }
}

String stack = "";
bool xNumber = false;
int x = 0;
int y = 0;

class ButtonGrid extends StatefulWidget {
  final Function updateDisplay;

  ButtonGrid({required this.updateDisplay, Key? key}) : super(key: key);

  @override
  _ButtonGridState createState() => _ButtonGridState();
}

class _ButtonGridState extends State<ButtonGrid> {
  final List<void Function()> button = [
    () {
    stack += "1";
    display.add("1");
    displayKey.currentState?.updateDisplay();
    },
    () {
      stack += "2";
      display.add("2");
      displayKey.currentState?.updateDisplay();
    },
    () {
      stack += "3";
      display.add("3");
      displayKey.currentState?.updateDisplay();
    },
    () {
      y = int.parse(stack);
      x = x + y;
      stack = "";
      display.add("+");
      displayKey.currentState?.updateDisplay();
    },
    () {
      stack += "4";
      display.add("4");
      displayKey.currentState?.updateDisplay();
    },
    () {
      stack += "5";
      display.add("5");
      displayKey.currentState?.updateDisplay();
    },
    () {
      stack += "6";
      display.add("6");
      displayKey.currentState?.updateDisplay();
    },
    () {
      y = int.parse(stack);
      x = x - y;
      stack = "";
      display.add("-");
      displayKey.currentState?.updateDisplay();
    },
    () {
      stack += "7";
      display.add("7");
      displayKey.currentState?.updateDisplay();
    },
    () {
    stack += "8";
    display.add("8");
    displayKey.currentState?.updateDisplay();
    },
    () {
      stack += "9";
      display.add("9");
      displayKey.currentState?.updateDisplay();
    },
    () {
      y = int.parse(stack);
      x = x * y;
      display.add("*");
      displayKey.currentState?.updateDisplay();
    },
    () {
      stack += "0";
      display.add("0");
      displayKey.currentState?.updateDisplay();
    },
    () {
      y = int.parse(stack);
      double a = x / y;
      x = a.toInt();
      display.add("/");
      displayKey.currentState?.updateDisplay();
    },
    () {
    if(xNumber == false) {
      xNumber = true;
      x = int.parse(stack);
      display.add(" ");
      displayKey.currentState?.updateDisplay();
      stack = "";
    } else {
      display.clear();
      display.add(x.toString() + " ");
      stack = "";
      displayKey.currentState?.updateDisplay();
    }
    },
    () {
    xNumber = false;
      stack = "";
      x = 0;
      y = 0;
      display.clear();
      displayKey.currentState?.updateDisplay();
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth / 4.0;

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: buttonWidth / 150.0,
      ),
      itemCount: button.length,
      itemBuilder: (context, index) {
        List<String> buttonText = [
          "1",
          "2",
          "3",
          "+",
          "4",
          "5",
          "6",
          "-",
          "7",
          "8",
          "9",
          "*",
          "0",
          "/",
          "Enter",
          "Clear",
        ];
        return ElevatedButton(
          onPressed: () {
            setState(() {
              button[index]();
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          child: Text(buttonText[index],
              style: TextStyle(fontSize: 25.0, color: Colors.white)),
        );
      },
    );
  }
}
