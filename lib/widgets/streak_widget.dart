import 'package:flutter/material.dart';

import '../models/streak_data.dart';
import 'glass_card.dart';

class StreakWidget extends StatelessWidget {
  const StreakWidget({super.key, required this.streak});

  final StreakData streak;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: <Widget>[
          const Text('🔥', style: TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Active Streaks'),
                Text('Daily ${streak.daily} • Focus ${streak.focus} • Study ${streak.study}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
