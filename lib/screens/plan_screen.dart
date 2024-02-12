import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: Row(
            children: [
              const Text('내 플랜'),
              Chip(
                padding: const EdgeInsets.all(1),
                labelStyle: const TextStyle(fontSize: 12, color: Colors.white),
                label: const Text('요약'),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.grey,
              )
            ],
          )),
    );
  }
}
