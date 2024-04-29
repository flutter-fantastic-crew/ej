import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scone_clone/entity/plan_entity.dart';
import 'package:scone_clone/utils/number_util.dart';

class ConsumptionByPlanWidget extends StatelessWidget {
  final PlanEntity plan;
  const ConsumptionByPlanWidget({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 35,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CupertinoColors.lightBackgroundGray,
              ),
              child: Text(
                plan.icon,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plan.name,
                  style: const TextStyle(fontSize: 10),
                ),
                Text(
                  '${currencyFormat(plan.totalConsumption)}원',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
        Row(
          children: [
            Text(
              plan.type == PlanType.free
                  ? '${currencyFormat(plan.totalIncome)}원'
                  : '${currencyFormat(plan.remainAmount)}원',
              style: plan.type == PlanType.free
                  ? const TextStyle(fontSize: 12, color: Colors.green)
                  : const TextStyle(fontSize: 12, color: Colors.black),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              plan.type == PlanType.free ? '수입' : '남음',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ],
        )
      ],
    );
  }
}
