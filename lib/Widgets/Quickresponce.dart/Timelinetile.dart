import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final endchild;

  const TimeLineTile({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    this.endchild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          beforeLineStyle: LineStyle(
            thickness: 2,
            color: isPast ? Colors.black : Colors.black,
          ),
          indicatorStyle: IndicatorStyle(
              width: 30.0,
              color: isPast ? Color(0xFF437d9c) : Color(0xFF437d9c),
              iconStyle: IconStyle(
                  iconData: Icons.add,
                  color: isPast ? Colors.white : Color(0xFFB0A695))),
          endChild: endchild,
        ),
      ),
    );
  }
}
