import 'package:flutter/material.dart';

import '../models/user_progress.dart';
import 'glass_card.dart';

class XpProgressWidget extends StatelessWidget {
  const XpProgressWidget({super.key, required this.progress});

  final UserProgress progress;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Level ${progress.level} • ${progress.rank}',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: LinearProgressIndicator(
              value: progress.progress,
              minHeight: 12,
               backgroundColor: Colors.white.withValues(alpha: 0.08),
            ),
          ),
          const SizedBox(height: 8),
          Text('${progress.currentXp}/${progress.nextLevelXp} XP • x${progress.comboMultiplier} combo'),
        ],
      ),
    );
  }
}
