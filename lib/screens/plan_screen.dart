import 'package:flutter/material.dart';
import 'package:scone_clone/components/text_badge.dart';
class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {

  handleAddClick() {}
  handleMoreClick() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          IconButton(
            style: const ButtonStyle(),
            onPressed: handleAddClick(), 
            icon: const Icon(Icons.add, color: Colors.grey,)
          ),
          IconButton(
            style: const ButtonStyle(),
            onPressed: handleMoreClick(),
            icon: const Icon(Icons.more_horiz, color: Colors.grey)
          )
        ],
        title: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 11.0),
              child: const Text('내 플랜'),
            ),
            const TextBadge(
              text: '요약', backgroundColor: Colors.grey
            ),
          ],
        )
      ),
      body: const Center(
          child: Text(
            '🪀 생활비',
            style: TextStyle(fontSize: 50),
          ),
        ),
    );
  }
}
