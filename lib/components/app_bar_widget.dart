import 'package:flutter/material.dart';
import 'package:scone_clone/components/text_badge_widget.dart';
import 'package:scone_clone/components/summary_bottom_sheet_widget.dart';

class AppBarWidget extends AppBar {
  AppBarWidget(BuildContext context, {super.key})
      : super(
            centerTitle: false,
            backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
            actions: [
              IconButton(
                  style: const ButtonStyle(),
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.grey)),
              IconButton(
                  style: const ButtonStyle(),
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz, color: Colors.grey))
            ],
            title: GestureDetector(
              onTap: () {
                 _showBottomSheet(context);
              },
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 11.0),
                    child: const Text('내 플랜'),
                  ),
                  const TextBadge(text: '요약', backgroundColor: Colors.grey),
                ],
              ),
            ));
              static void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return const SummaryBottomSheetWidget();
      },
    );
  }
}
