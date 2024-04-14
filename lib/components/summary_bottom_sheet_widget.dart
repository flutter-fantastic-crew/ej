import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:scone_clone/components/account_card_widget.dart';
import 'package:scone_clone/components/consume_widget.dart';
import 'package:scone_clone/view_model/plan_model.dart';

class SummaryBottomSheetWidget extends StatelessWidget {
  const SummaryBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat('###,###,###,###');
    final planModel = Provider.of<PlanModel>(context, listen: false);
    moneyWithText(total) => '/ ${f.format(total)} 원';

    return FractionallySizedBox(
      heightFactor: 0.88,
        child: Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // 더미데이터
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '요약',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<String?>(
                icon: const Icon(Icons.expand_more_rounded),
                underline: const SizedBox(),
                items: [null, 'KRW', 'USD']
                    .map<DropdownMenuItem<String?>>((String? i) {
                  return DropdownMenuItem<String?>(
                    value: i,
                    child: Text(
                        {'KRW': '대한민국 - 원', 'USD': '미국 - 달러'}[i] ?? '대한민국 - 원'),
                  );
                }).toList(),
                onChanged: (String? value) {},
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AccountCardWidget(label: '총 소비', account: 0),
              AccountCardWidget(
                label: '총 수입',
                account: 0,
                textColor: Colors.green[700],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 32,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.grey[100],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(children: [
                      Text('남은 총 예산'),
                      SizedBox(width: 5),
                      Text(
                        '0원',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ]),
                    Text(moneyWithText(planModel.getOriginalTotalBudget()),
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w600))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '플랜별 소비',
              style: TextStyle(color: Colors.black38),
              textAlign: TextAlign.left,
            ),
          ]),
          Consumer<PlanModel>(
              builder: (context, planModel, child) => (ListView.builder(
                  shrinkWrap: true,
                  itemCount: planModel.plans.length,
                  itemBuilder: (context, index) {
                    final plan = planModel.plans[index];
                    return ConsumeWidget(plan: plan);
                  })))
        ],
      ),
    ));
  }
}
