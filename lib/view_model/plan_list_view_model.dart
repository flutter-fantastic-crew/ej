import 'package:flutter/material.dart';
import 'package:scone_clone/entity/plan_entity.dart';
import 'package:scone_clone/entity/plan_history_entity.dart';

class PlanListViewModel extends ChangeNotifier {
  final pageController = PageController(initialPage: 0);
  final List<PlanEntity> _plans = [
    PlanEntity(
        id: 0,
        type: PlanType.free,
        startDate: DateTime(2024, 4, 21),
        endDate: DateTime(2024, 5, 1),
        memo: "",
        name: "자유1",
        icon: "😀",
        planHistory: [
          PlanHistoryEntity(
            id: 0,
            type: PlanHistoryType.consumption,
            memo: "메모1",
            createAt: DateTime.now(),
            amount: 100,
          ),
          PlanHistoryEntity(
            id: 1,
            type: PlanHistoryType.consumption,
            memo: "메모2",
            createAt: DateTime.now(),
            amount: 500,
          )
        ],
        totalAmount: 0),
    PlanEntity(
        id: 1,
        type: PlanType.plan,
        startDate: DateTime(2024, 4, 1),
        endDate: DateTime(2024, 4, 28),
        memo: "",
        name: "계획1",
        icon: "😍",
        planHistory: [
          PlanHistoryEntity(
            id: 0,
            type: PlanHistoryType.consumption,
            memo: "메모1",
            createAt: DateTime.now(),
            amount: 100,
          ),
          PlanHistoryEntity(
            id: 1,
            type: PlanHistoryType.consumption,
            memo: "메모2",
            createAt: DateTime.now(),
            amount: 200,
          )
        ],
        totalAmount: 1000),
    PlanEntity(
      id: 2,
      type: PlanType.free,
      startDate: DateTime(2024, 4, 1),
      endDate: DateTime(2024, 5, 1),
      memo: "자유2",
      name: "자유2",
      icon: "😁",
      planHistory: [
        PlanHistoryEntity(
          id: 0,
          type: PlanHistoryType.income,
          memo: '급여',
          createAt: DateTime.now(),
          amount: 100000,
        ),
      ],
      totalAmount: 0,
    ),
    PlanEntity(
      id: 3,
      type: PlanType.plan,
      startDate: DateTime(2024, 4, 1),
      endDate: DateTime(2024, 5, 1),
      memo: "계획2",
      name: "계획2",
      icon: "😁",
      planHistory: [],
      totalAmount: 1000,
    ),
    PlanEntity(
      id: 4,
      type: PlanType.free,
      startDate: DateTime(2024, 4, 1),
      endDate: DateTime(2024, 5, 1),
      memo: "자유3",
      name: "자유3",
      icon: "😁",
      planHistory: [],
      totalAmount: 0,
    ),
    PlanEntity(
        id: 5,
        type: PlanType.free,
        startDate: DateTime(2024, 4, 21),
        endDate: DateTime(2024, 4, 23),
        memo: "자유4",
        name: "자유4",
        icon: "😀",
        planHistory: [
          PlanHistoryEntity(
            id: 0,
            type: PlanHistoryType.consumption,
            memo: "메모1",
            createAt: DateTime.now(),
            amount: 1000,
          ),
        ],
        totalAmount: 0),
    PlanEntity(
        id: 6,
        type: PlanType.plan,
        startDate: DateTime(2024, 4, 21),
        endDate: DateTime(2024, 4, 23),
        memo: "계획3",
        name: "계획3",
        icon: "😀",
        planHistory: [
          PlanHistoryEntity(
            id: 0,
            type: PlanHistoryType.consumption,
            memo: "메모1",
            createAt: DateTime.now(),
            amount: 7000,
          ),
        ],
        totalAmount: 10000),
  ];
  int _currentPage = 0;

  // getter
  List<PlanEntity> get plans => _plans;
  int get currentPage => _currentPage;

  void changePage(int currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  int get totalConsumption =>
      _plans.fold(0, (sum, plan) => sum + plan.totalConsumption);

  int get totalIncome => _plans.fold(0, (sum, plan) => sum + plan.totalIncome);

  int get remainAmount => _plans.fold(
      0,
      (sum, plan) =>
          sum + (plan.type == PlanType.plan ? plan.remainAmount : 0));

  int get budget => _plans.fold(0, (sum, plan) => sum + plan.totalAmount);
}
