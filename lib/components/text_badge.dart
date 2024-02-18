import 'package:flutter/material.dart';

class TextBadge extends StatelessWidget {

  const TextBadge({
    super.key, 
    required this.backgroundColor,
    required this.text,
  });

  final String text;
  final MaterialColor backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17,
      width: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
      ),
      child: Text(text, style: const TextStyle(fontSize: 12, color: Colors.white)),
    );
  }
}