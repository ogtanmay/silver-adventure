import 'package:flutter/material.dart';

import '../models/goal.dart';
import 'glass_card.dart';

class GoalRingWidget extends StatelessWidget {
  const GoalRingWidget({super.key, required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 72,
            height: 72,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  value: goal.ratio,
                  strokeWidth: 8,
                  backgroundColor: Colors.white.withOpacity(0.08),
                ),
                Text('${(goal.ratio * 100).round()}%'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(goal.title, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
