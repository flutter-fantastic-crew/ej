import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scone_clone/components/app_bar_widget.dart';
import 'package:scone_clone/view_model/plan_model.dart';

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
      appBar: AppBarWidget(context),
      body: Container(
        color: const Color.fromRGBO(243, 243, 243, 1),
        child: SafeArea(
          child: ChangeNotifierProvider<PlanModel>(
            create: (_) => PlanModel(),
            builder: (context, child) {
              return Column(
                children: [
                  Consumer<PlanModel>(
                    // 데이터 변조가 일어나면 새로 랜더링 됨
                    builder: (_, planModel, __) {
                      return Expanded(
                        child: PageView.builder(
                          onPageChanged: planModel.changePage,
                          controller: planModel.pageController,
                          itemCount: planModel.plans.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                padding: const EdgeInsets.all(50),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(planModel.plans[index].planIcon),
                                        Text(planModel.plans[index].planName),
                                      ],
                                    ),
                                  ],
                                ));
                          },
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                          context.watch<PlanModel>().plans.length,
                          (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor:
                                      context.watch<PlanModel>().currentPage ==
                                              index
                                          ? const Color(0xFF181818)
                                          : Colors.grey,
                                ),
                              )),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
