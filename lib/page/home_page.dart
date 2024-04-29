import 'package:flutter/material.dart';
import 'package:scone_clone/view_model/plan_list_view_model.dart';
import 'package:scone_clone/widget/app_bar_widget.dart';
import 'package:scone_clone/widget/plan_card_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlanListViewModel>(
      create: (_) => PlanListViewModel(),
      builder: (context, child) {
        return Scaffold(
            appBar: AppBarWidget(context),
            body: Column(
              children: [
                Consumer<PlanListViewModel>(
                    builder: (context, planListViewModel, child) {
                  return Expanded(
                    child: PageView.builder(
                        controller: planListViewModel.pageController,
                        onPageChanged: planListViewModel.changePage,
                        itemCount: planListViewModel.plans.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PlanCardWidget(
                            plan: planListViewModel.plans[index],
                          );
                        }),
                  );
                }),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                        context.watch<PlanListViewModel>().plans.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: context
                                            .watch<PlanListViewModel>()
                                            .currentPage ==
                                        index
                                    ? const Color(0xFF181818)
                                    : Colors.grey,
                              ),
                            )),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
