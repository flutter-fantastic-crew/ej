import 'package:flutter/material.dart';
import 'package:scone_clone/components/text_badge.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({super.key})
      : super(
            centerTitle: false,
            actions: [
              IconButton(
                  style: const ButtonStyle(),
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.grey)),
              IconButton(
                  style: const ButtonStyle(),
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz, color: Colors.grey))
            ],
            title: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 11.0),
                  child: const Text('내 플랜'),
                ),
                const TextBadge(text: '요약', backgroundColor: Colors.grey),
              ],
            ));
}
