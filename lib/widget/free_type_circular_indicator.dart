import 'package:flutter/material.dart';
import 'package:scone_clone/entity/plan_entity.dart';
import 'package:scone_clone/widget/circular_inner_free_type_info.dart';
import 'package:scone_clone/widget/circular_inner_remaining_time.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FreeTypeCircularIndicator extends StatefulWidget {
  final PlanEntity plan;

  const FreeTypeCircularIndicator({super.key, required this.plan});

  @override
  State<StatefulWidget> createState() => _FreeTypeCircularIndicatorState();
}

class _FreeTypeCircularIndicatorState extends State<FreeTypeCircularIndicator> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final double percent = DateTime.now()
            .difference(widget.plan.endDate)
            .inDays
            .toDouble() /
        widget.plan.startDate.difference(widget.plan.endDate).inDays.toDouble();

    return CircularPercentIndicator(
      radius: 90,
      lineWidth: _isPressed ? 4 : 1.5,
      backgroundWidth: 1.5,
      percent: percent < 0 ? 0 : percent,
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: const Color(0xFFF2F2F2),
      progressColor: Colors.black,
      widgetIndicator: Center(
        child: Container(
            width: 14,
            height: 14,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Listener(
              onPointerDown: (e) => setState(() {
                _isPressed = true;
              }),
              onPointerUp: (e) => setState(() {
                _isPressed = false;
              }),
              child: Transform.rotate(
                angle: percent < 0 ? 0 : radians(-360 * percent).toDouble(),
                child: SvgPicture.asset(
                  'assets/icons/timer.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              ),
            )),
      ),
      animation: true,
      // TODO : animation 추가
      center: _isPressed
          ? CircularInnerRemainingTime(
              startDate: widget.plan.startDate, endDate: widget.plan.endDate)
          : CircularInnerFreeTypeInfo(
              totalConsumption: widget.plan.totalConsumption,
              totalIncome: widget.plan.totalIncome),
    );
  }
}
