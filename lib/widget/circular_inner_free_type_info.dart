import 'package:flutter/material.dart';
import 'package:scone_clone/utils/number_util.dart';

class CircularInnerFreeTypeInfo extends StatelessWidget {
  final int totalConsumption;
  final int totalIncome;

  const CircularInnerFreeTypeInfo(
      {super.key, required this.totalConsumption, required this.totalIncome});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '소비 금액',
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
            Text(
              '${currencyFormat(totalConsumption)}원',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '${currencyFormat(totalIncome)}원',
          style: const TextStyle(
            color: Colors.green,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
