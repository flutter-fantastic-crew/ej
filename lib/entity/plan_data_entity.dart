import 'package:scone_clone/entity/plan_history_data_entity.dart';

class PlanDataEntity {
  int planId; // 플랜아이디
  DateTime planStartDate; // 플랜 시작일
  DateTime planEndDate; // 플랜 종료일
  String planType; // 타입 (계획 / 자유)
  String planMemo; // 플랜 설명 (메모)
  String planName; // 플랜 이름
  String planIcon; // 플랜 아이콘
  List<PlanHistoryDataEntity> planHistoryData;
  int total; // 총금액

  PlanDataEntity({
    required this.planId,
    required this.planStartDate,
    required this.planEndDate,
    required this.planType,
    required this.planMemo,
    required this.planName,
    required this.planIcon,
    required this.total,
    required this.planHistoryData,
  });

  int get totalExpenses {
    final income =
        planHistoryData.where((element) => element.type == 'EXPENSE').toList();
    return income
        .map((e) => e.amount)
        .reduce((value, element) => value + element);
  }

  get type => null;
}
