import 'package:flutter/material.dart';

class CircularInnerRemainingTime extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  const CircularInnerRemainingTime(
      {super.key, required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '남은 시간',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            endDate.difference(DateTime.now()).inDays.toInt() < 0
                ? const Text(
                    '완료',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  )
                : Text(
                    '${endDate.difference(DateTime.now()).inDays}일',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '/ ${endDate.difference(startDate).inDays}일',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
