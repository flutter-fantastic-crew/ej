import 'package:flutter/material.dart';
import 'package:scone_clone/components/app_bar_widget.dart';
import 'package:scone_clone/components/horizontal_list.dart';
class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {

  handleAddClick() {}
  handleMoreClick() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: const HorizontalList()
    );
  }
}
