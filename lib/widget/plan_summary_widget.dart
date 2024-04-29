import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scone_clone/utils/number_util.dart';
import 'package:scone_clone/view_model/plan_list_view_model.dart';
import 'package:scone_clone/widget/consumption_by_plan_widget.dart';
import 'package:provider/provider.dart';

class PlanSummaryWidget extends StatelessWidget {
  const PlanSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.88,
      widthFactor: 1,
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '요약',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '대한민국 - 원',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: Scrollbar(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CupertinoColors.lightBackgroundGray,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '총 소비',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                '${currencyFormat(context.read<PlanListViewModel>().totalConsumption)} 원',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Expanded(
                        child: Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CupertinoColors.lightBackgroundGray,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '총 수입',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                '${currencyFormat(context.read<PlanListViewModel>().totalIncome)} 원',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CupertinoColors.lightBackgroundGray,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              '남은 총 예산',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              context.read<PlanListViewModel>().remainAmount > 0
                                  ? '${currencyFormat(context.read<PlanListViewModel>().remainAmount)}원'
                                  : '--',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              '/',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              context.read<PlanListViewModel>().budget > 0
                                  ? '${currencyFormat(context.read<PlanListViewModel>().budget)}원'
                                  : '설정되지 않음',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    children: [
                      Text(
                        '플랜별 소비',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  context.read<PlanListViewModel>().plans.isNotEmpty
                      ? Column(
                          children: List<Widget>.generate(
                              context.read<PlanListViewModel>().plans.length,
                              (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: ConsumptionByPlanWidget(
                                plan: context
                                    .read<PlanListViewModel>()
                                    .plans[index],
                              ),
                            );
                          }),
                        )
                      : const Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: Text(
                                '진행중인 플랜이 없습니다.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            )
                          ],
                        )
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
