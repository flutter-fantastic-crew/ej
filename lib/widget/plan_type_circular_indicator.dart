import 'package:flutter/material.dart';
import 'package:scone_clone/entity/plan_entity.dart';
import 'package:scone_clone/widget/circular_inner_plan_type_info.dart';
import 'package:scone_clone/widget/circular_inner_remaining_time.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PlanTypeCircularIndicator extends StatefulWidget {
  final PlanEntity plan;

  const PlanTypeCircularIndicator({super.key, required this.plan});

  @override
  State<StatefulWidget> createState() => _PlanTypeCircularIndicatorState();
}

class _PlanTypeCircularIndicatorState extends State<PlanTypeCircularIndicator> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final double percent = DateTime.now()
            .difference(widget.plan.endDate)
            .inDays
            .toDouble() /
        widget.plan.startDate.difference(widget.plan.endDate).inDays.toDouble();

    return CircularPercentIndicator(
        radius: 100,
        lineWidth: _isPressed ? 4 : 1.5,
        percent: percent < 0 ? 0 : percent,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: const Color(0xFFF2F2F2),
        backgroundColor: Colors.transparent,
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
                    colorFilter: const ColorFilter.mode(
                        Color(0xFFF2F2F2), BlendMode.srcIn),
                  ),
                )),
          ),
        ),
        animation: true,
        center: CircularPercentIndicator(
          radius: 90,
          lineWidth: 12,
          percent: widget.plan.remainAmount.toDouble() /
              widget.plan.totalAmount.toDouble(),
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: const Color(0xFFF2F2F2),
          progressColor: _isPressed || percent < 0
              ? const Color(0xFFD5D5D5)
              : const Color(0xFF1773FC),
          animation: true,
          // TODO : animation 추가
          center: _isPressed
              ? CircularInnerRemainingTime(
                  startDate: widget.plan.startDate,
                  endDate: widget.plan.endDate)
              : CircularInnerPlanTypeInfo(
                  remainAmount: widget.plan.remainAmount,
                  totalAmount: widget.plan.totalAmount),
        ));
  }
}
