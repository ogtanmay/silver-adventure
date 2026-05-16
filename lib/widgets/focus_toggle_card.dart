import 'package:flutter/material.dart';

import 'glass_card.dart';

class FocusToggleCard extends StatelessWidget {
  const FocusToggleCard({
    super.key,
    required this.enabled,
    required this.onChanged,
  });

  final bool enabled;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Focus Mode'),
              SizedBox(height: 4),
              Text('Allowed apps only • grayscale • ambient sounds'),
            ],
          ),
          Switch(value: enabled, onChanged: onChanged),
        ],
      ),
    );
  }
}
