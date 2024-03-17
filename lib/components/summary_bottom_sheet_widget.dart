import 'package:flutter/material.dart';

class SummaryBottomSheetWidget {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 높이 전체를 사용하는 true
      builder: (BuildContext context) {
        return _buildSummaryBottomSheetContent(context);
      },
    );
  }

  static Widget _buildSummaryBottomSheetContent(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double sheetHeight = screenHeight * 0.86; // 90%의 높이

    return Container(
      padding: const EdgeInsets.all(16.0),
      height: sheetHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // 더미데이터
          Row(

            children: [
              const Text(
                '요약',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<String?>(
                items: [null, 'KRW', 'USD']
                    .map<DropdownMenuItem<String?>>((String? i) {
                  return DropdownMenuItem<String?>(
                    value: i,
                    child: Text({'KRW': '대한민국 - 원', 'USD': '미국 - 달러'}[i] ?? '대한민국 - 원'),
                  );
                }).toList(), onChanged: (String? value) {  },
              )
            ],
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text('총 소비'),
            onTap: () {
              // 일정 요약 로직을 추가할 수 있습니다.
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('총 수입'),
            onTap: () {
              // 통계 요약 로직을 추가할 수 있습니다.
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
