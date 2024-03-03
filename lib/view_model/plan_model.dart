import 'package:flutter/material.dart';
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
        planMemo: "메모2",
        planName: "계획 이름",
        planIcon: "😀",
        totalPlan: 1000)
  ];

  int _currentPage = 0;
  int get currentPage => _currentPage;

  void changePage(int currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  List<PlanDataEntity> get plans => _plans;

  void addPlan(PlanDataEntity plan) {
    _plans.add(plan);
    notifyListeners();
  }
}
