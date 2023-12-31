import 'package:flutter/material.dart';
import 'package:telego/Variables.dart';

class MyButton extends StatelessWidget{
  final void Function()? onTap;
  final String text;
  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: primary_orange_color,
          borderRadius: BorderRadius.circular(9)
        ),
        child: Center(
          child: Text(text, style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
        )
      )
    );
  }
}