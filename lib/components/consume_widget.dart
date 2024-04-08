import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scone_clone/view_model/plan_model.dart';

class ConsumeWidget extends StatelessWidget {
  const ConsumeWidget(PlanModel planModel, {super.key});

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat('###,###,###,###');
    var money = f.format(20000);
    String usedMoney = '$money원';

    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 32,
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                    alignment: Alignment.center,
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Text('😁',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22))),
                const SizedBox(width: 15),
                Column(
                  children: [
                    const Text(
                      '강아지 간식',
                    ),
                    Text(
                      usedMoney,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ]),
              Row(
                children: [
                  Text('0원',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700])),
                  const SizedBox(width: 10),
                  Text('남음', style: TextStyle(color: Colors.grey[600]))
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
