import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountCardWidget extends StatelessWidget {
  const AccountCardWidget({
    super.key,
    required this.label,
    required this.account,
    this.textColor = Colors.black,
  });

  final double account;
  final String label;
  final dynamic textColor;

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat('###,###,###,###');
    var money = f.format(account);
    double screenWidth = MediaQuery.of(context).size.width;
    String text = '$money원';

    return Container(
      width: screenWidth / 2 - 25,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey[100],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black45)),
          Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: textColor))
        ]
      )
    );
  }
}
