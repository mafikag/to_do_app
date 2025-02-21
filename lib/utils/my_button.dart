import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  MyButton({super.key, required this.text, required this.onPressed});

  IconData icon(String text) {
    if (text == "save") {
      return Icons.save;
    } else {
      return Icons.clear;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 40,
      color: Colors.yellow[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Icon(icon(text), color: Colors.yellow[200]),
    );
  }
}
