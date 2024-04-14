import 'package:flutter/material.dart';
import 'package:scone_clone/entity/plan_history_data_entity.dart';
import '../entity/plan_data_entity.dart';

class PlanModel with ChangeNotifier {
  final pageController = PageController(
    initialPage: 0,
  );

  final List<PlanDataEntity> _plans = [
    PlanDataEntity(
        planId: 0,
        planStartDate: DateTime.now(),
        planEndDate: DateTime.now(),
        planType: "FREE",
        planMemo: "메모2",
        planName: "계획 이름",
        planIcon: "😀",
        total: 1000,
        planHistoryData: [
          PlanHistoryDataEntity(
            id: 0,
            type: "EXPENSE",
            memo: "메모1",
            createAt: DateTime.now(),
            amount: 500,
          ),
          PlanHistoryDataEntity(
            id: 1,
            type: "INCOME",
            memo: "메모2",
            createAt: DateTime.now(),
            amount: 600,
          )
        ],
    )];

  List<PlanDataEntity> get plans => _plans; // 접근 제어자에 대한 get만 허용

  int _currentPage = 0;

  int get currentPage => _currentPage;
  int getTotalAmountByType(String type) {
    return plans.fold(
        0,
        (total, plan) =>
            total +
            plan.planHistoryData
                .where((e) => e.type == type)
                .fold(0, (sum, history) => sum + history.amount));
  }

  int getOriginalTotalBudget() {
    return plans
        .where((e) => (e.planType == 'SET'))
        .fold(0, (total, plan) => total + plan.total);
  }

  int getCurrentBudget() {
    return plans.where((e) => (e.planType == 'SET')).fold(
        0,
        (total, plan) =>
            total +
            plan.planHistoryData
                .where((e) => e.type == 'EXPENSE')
                .fold(0, (sum, history) => sum + history.amount));
  }
  
  void changePage(int currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }


  void addPlan(PlanDataEntity plan) {
    _plans.add(plan);
    notifyListeners();
  }
}
