import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePickerWidget extends StatelessWidget {
  final DateTime currentDate;
  final double? width;
  final double? height;

  const DatePickerWidget(
      {super.key, required this.currentDate, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: width,
      heightFactor: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        child: Column(
          children: [
            const Text(
              '날짜 선택',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            Scrollbar(
              child: TableCalendar(
                locale: 'ko_KR',
                focusedDay: currentDate,
                firstDay: DateTime(DateTime.now().year - 1, 1, 1),
                lastDay: DateTime(DateTime.now().year + 1, 12, 31),
                onDaySelected: (selectedDay, focusedDay) {
                  context.pop(selectedDay);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
