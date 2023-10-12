import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: [
                Text(userInput.toString(),
                    style: const TextStyle(fontSize: 30, color: Colors.white)),
                const SizedBox(height: 20),
                Text(answer.toString(),
                    style: const TextStyle(fontSize: 40, color: Colors.white)),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Row(
                children: [
                  MyButton(
                    title: 'AC',
                    color: Colors.red,
                    onPress: () {
                      userInput = '';
                      answer = '';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '+/-',
                    color: Colors.red,
                    onPress: () {
                      userInput += '+/-';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '%',
                    color: Colors.red,
                    onPress: () {
                      userInput += '%';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '/',
                    onPress: () {
                      userInput += '/';
                      setState(() {});
                    },
                    color: const Color(0xffffa00a),
                  ),
                ],
              ),
              Row(
                children: [
                  MyButton(
                    title: '7',
                    onPress: () {
                      userInput += '7';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '8',
                    onPress: () {
                      userInput += '8';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '9',
                    onPress: () {
                      userInput += '9';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: 'x',
                    onPress: () {
                      userInput += 'x';
                      setState(() {});
                    },
                    color: Color(0xffffa00a),
                  ),
                ],
              ),
              Row(
                children: [
                  MyButton(
                    title: '4',
                    onPress: () {
                      userInput += '4';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '5',
                    onPress: () {
                      userInput += '5';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '6',
                    onPress: () {
                      userInput += '6';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '+',
                    onPress: () {
                      userInput += '+';
                      setState(() {});
                    },
                    color: Color(0xffffa00a),
                  ),
                ],
              ),
              Row(
                children: [
                  MyButton(
                    title: '1',
                    onPress: () {
                      userInput += '1';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '2',
                    onPress: () {
                      userInput += '2';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '3',
                    onPress: () {
                      userInput += '3';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '-',
                    onPress: () {
                      userInput += '-';
                      setState(() {});
                    },
                    color: Color(0xffffa00a),
                  ),
                ],
              ),
              Row(
                children: [
                  MyButton(
                    title: '0',
                    onPress: () {
                      userInput += '0';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '.',
                    onPress: () {
                      userInput += '.';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: 'DEL',
                    onPress: () {
                      userInput =
                          userInput.substring(0, userInput.length - 1);
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '=',
                    color: Colors.green,
                    onPress: () {
                      _equals();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        ],
        ),
      ),
    );
  }

  void _equals() {
    var x = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(x);
    ContextModel contextModel = ContextModel();
    double equal = expression.evaluate(EvaluationType.REAL, contextModel);
    answer ='=$equal';
  }
}
