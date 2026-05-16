import 'package:flutter/material.dart';

import 'glass_card.dart';

class ProductivitySummaryWidget extends StatelessWidget {
  const ProductivitySummaryWidget({
    super.key,
    required this.focusScore,
    required this.deepWorkHours,
  });

  final int focusScore;
  final double deepWorkHours;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Productivity Analytics', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          Text('AI Focus Score: $focusScore'),
          Text('Deep Work (weekly): ${deepWorkHours.toStringAsFixed(1)}h'),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: LinearProgressIndicator(
              value: focusScore / 100,
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }
}
