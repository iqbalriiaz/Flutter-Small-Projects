import 'dart:math';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Random Dice',
        home: Dice());
  }
}


class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber = random.nextInt(6) + 1;
    return Scaffold(
      appBar: AppBar(title: Text("Random Dice"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {});
            },
            child: Image.asset('images/dice$randomNumber.png'),
          ),
        ],
      ),
    );
  }
}
