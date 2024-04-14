class PlanHistoryDataEntity {
  int id; // 아이디
  String type; // 타입 (EXPENSE / INCOME)
  int amount; // 금액
  String memo; // 메모
  DateTime createAt; // 생성 일자

  PlanHistoryDataEntity({
    required this.id,
    required this.type,
    required this.amount,
    required this.memo,
    required this.createAt
  });
}