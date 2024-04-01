import 'package:flutter/material.dart';
import 'package:scone_clone/components/account_card_widget.dart';
import 'package:scone_clone/components/consume_widget.dart';
import 'package:intl/intl.dart';

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
    var f = NumberFormat('###,###,###,###');
    var money = f.format(20000);
    String text = '/ $money원';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                icon: const Icon(Icons.expand_more_rounded),
                underline: const SizedBox(),
                items: [null, 'KRW', 'USD']
                    .map<DropdownMenuItem<String?>>((String? i) {
                  return DropdownMenuItem<String?>(
                    value: i,
                    child: Text(
                        {'KRW': '대한민국 - 원', 'USD': '미국 - 달러'}[i] ?? '대한민국 - 원'),
                  );
                }).toList(),
                onChanged: (String? value) {},
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AccountCardWidget(label: '총 소비', account: 0),
              AccountCardWidget(
                label: '총 수입',
                account: 0,
                textColor: Colors.green[700],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 32,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.grey[100],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(children: [
                      Text('남은 총 예산'),
                      SizedBox(width: 5),
                      Text(
                        '0원',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )
                    ]),
                    Text(text,
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w600))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 30,),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '플랜별 소비',
                style: TextStyle(color: Colors.black38),
                textAlign: TextAlign.left,
              ),
              ConsumeWidget()
            ],
          )
        ],
      ),
    );
  }
}
