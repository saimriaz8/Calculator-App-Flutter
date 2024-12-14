import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/buttons_of_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String value = '';
  double firstOperand = 0;
  double secondOperand = 0;
  bool secondOperandTurn = false;
  String operator = "";
  double result = 0;

  void clickedToAddValue(String valueOfButton) {
    setState(() {
      if (valueOfButton == "C") {
        value = "";
        result = 0;
      } else if (secondOperandTurn) {
        value = "";
        value = value + valueOfButton;
        secondOperandTurn = false;
      } else {
        value = value + valueOfButton;
      }
    });
  }

  void operatorListener(String operator) {
    setState(() {
      if (value != "") {
        if (result == 0) {
          firstOperand = double.parse(value);
        } else {
          firstOperand = result;
          value = "$result";
        }
        value = value + operator;
        this.operator = operator;
        secondOperandTurn = true;
      }
    });
  }

  void equalFunction() {
    setState(() {
      switch (operator) {
        case '%':
          result = firstOperand % double.parse(value);
          break;
        case '+':
          result = firstOperand + double.parse(value);
          break;
        case '×':
          result = firstOperand * double.parse(value);
          break;
        case '-':
          result = firstOperand - double.parse(value);
          break;
        case '÷':
          result = firstOperand / double.parse(value);
          break;
        default:
          result = 0;
      }
    });
  }

  void delButtonFunction() {
    setState(() {
      String data = '';
      for (var i = 0; i < value.length - 1; i++) {
        data = data + value[i];
      }
      value = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var Size(:width, :height) = size;
    return Scaffold(
      backgroundColor: const Color(0xFFF1F2F3),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Calculator",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: width * 0.9,
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: width * 0.9,
                child: Text("$result",
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonsOfCalculator(width: width, height: height, buttonValue: 'C', onPressed: () => clickedToAddValue('C'), color: const Color(0xFFD2D3DA),),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '+/-', onPressed: () => VoidCallback , color:  const Color(0xFFD2D3DA)),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '%', onPressed: () => operatorListener('%'), color: const Color(0xFFD2D3DA)),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '÷', onPressed: () => operatorListener('÷'), color: const Color(0xFF4B5EFC))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '7', onPressed: () => clickedToAddValue('7'), color: Colors.white),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '8', onPressed: () => clickedToAddValue('8'), color: Colors.white),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '9', onPressed: () => clickedToAddValue('9'), color: Colors.white),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '×', onPressed: () => operatorListener('×'), color: const Color(0xFF4B5EFC))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '4', onPressed: () => clickedToAddValue('4'), color: Colors.white),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '5', onPressed: () => clickedToAddValue('5'), color: Colors.white),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '6', onPressed: () => clickedToAddValue('6'), color: Colors.white),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '-', onPressed: () => operatorListener('-'), color: const Color(0xFF4B5EFC))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '1', onPressed: () => clickedToAddValue('1'), color: Colors.white),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '2', onPressed: () => clickedToAddValue('2'), color: Colors.white),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '3', onPressed: () => clickedToAddValue('3'), color: Colors.white),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '+', onPressed: () => operatorListener('+'), color: const Color(0xFF4B5EFC))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '.', onPressed: () => clickedToAddValue('.'), color: Colors.white),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '0', onPressed: () => clickedToAddValue('0'), color: Colors.white),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: 'DEL', onPressed: () => delButtonFunction(), color: Colors.white),
                        ButtonsOfCalculator(width: width, height: height, buttonValue: '=', onPressed: () => equalFunction(), color: const Color(0xFF4B5EFC))
                      ],
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
