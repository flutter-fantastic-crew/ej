import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:scone_clone/entity/plan_entity.dart';
import 'package:scone_clone/view_model/plan_list_view_model.dart';
import 'package:scone_clone/widget/add_history_input_widget.dart';
import 'package:scone_clone/widget/date_picker_widget.dart';
import 'package:scone_clone/widget/text_field_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AddHistoryPage extends StatefulWidget {
  final String planId;

  // TODO : API 호출하여 상세 데이터 조회
  final PlanEntity plan = PlanListViewModel().plans[0];

  AddHistoryPage({super.key, required this.planId});

  @override
  State<StatefulWidget> createState() => _AddHistoryPageState();
}

class _AddHistoryPageState extends State<AddHistoryPage> {
  final TextEditingController _priceTextController = TextEditingController();
  bool _isEmojiPickerVisible = false;
  String _emoji = '😀';
  DateTime _date = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  void dispose() {
    _priceTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              '내역 추가',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 2,
            ),
            Text('${widget.plan.icon} ${widget.plan.name}',
                style: const TextStyle(fontSize: 10)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 17,
          ),
          onPressed: () => context.pop(),
          // padding: EdgeInsets.only(left: 0),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                AddHistoryInputWidget(controller: _priceTextController),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextFieldWidget(
                    hintText: '내용',
                    hintStyle: const TextStyle(color: Color(0xFFBEBEBE)),
                    prefix: GestureDetector(
                      onTap: () => setState(() {
                        _isEmojiPickerVisible = !_isEmojiPickerVisible;
                      }),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: Text(_emoji),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          showDragHandle: false,
                          isScrollControlled: true,
                          context: context,
                          builder: (_) {
                            return DatePickerWidget(
                              width: 1,
                              height: 0.8,
                              currentDate: _date,
                            );
                          }).then((value) => setState(() {
                            _date = value;
                          }));
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 8),
                                child: const Icon(
                                  Icons.calendar_month,
                                  color: Color(0xFFC4C4C4),
                                ),
                              ),
                              Text(DateFormat('M월 d일 EEEE', 'ko_KR')
                                  .format(_date)),
                            ],
                          ),
                          _date.difference(DateTime.now()).inDays == 0
                              ? const Text(
                                  '오늘',
                                  style: TextStyle(color: Color(0xFF1773FC)),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Offstage(
                offstage: !_isEmojiPickerVisible,
                // TODO : 이미지 피커 스타일 수정
                child: EmojiPicker(
                  onEmojiSelected: (category, emoji) => setState(() {
                    _emoji = emoji.emoji.toString();
                    _isEmojiPickerVisible = !_isEmojiPickerVisible;
                  }),
                ),
              ))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18),
        child: ElevatedButton(
          onPressed: () => context.pop(),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1773FC),
            minimumSize: const Size(100, 45),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text(
            '저장',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
