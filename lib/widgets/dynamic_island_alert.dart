import 'package:flutter/material.dart';

class DynamicIslandAlert extends StatelessWidget {
  const DynamicIslandAlert({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 64),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.bolt_rounded, size: 16),
          const SizedBox(width: 8),
          Flexible(child: Text(message, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
