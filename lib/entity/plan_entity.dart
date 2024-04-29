import 'package:scone_clone/entity/plan_history_entity.dart';

class PlanEntity {
  int id; // 아이디
  DateTime startDate; // 시작일
  DateTime endDate; // 종료일
  PlanType type; // 타입 (계획 / 자유)
  String name; // 이름
  String memo; // 설명 (메모)
  String icon; // 아이콘
  List<PlanHistoryEntity> planHistory; // 소비지출 기록 리스트
  int totalAmount; // 총 금액

  PlanEntity({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.name,
    required this.memo,
    required this.icon,
    required this.planHistory,
    required this.totalAmount,
  });

  int get totalConsumption => planHistory.fold(
      0,
      (sum, element) => element.type == PlanHistoryType.consumption
          ? sum + element.amount
          : 0);

  int get totalIncome => planHistory.fold(
      0,
      (sum, element) =>
          element.type == PlanHistoryType.income ? sum + element.amount : 0);

  int get remainAmount => totalAmount - totalConsumption;
}

enum PlanType {
  plan,
  free,
}
