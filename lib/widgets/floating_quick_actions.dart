import 'package:flutter/material.dart';

class FloatingQuickActions extends StatelessWidget {
  const FloatingQuickActions({
    super.key,
    required this.onAddTask,
    required this.onStartSession,
  });

  final VoidCallback onAddTask;
  final VoidCallback onStartSession;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FloatingActionButton.small(
          heroTag: 'add-task',
          onPressed: onAddTask,
          child: const Icon(Icons.add_task_outlined),
        ),
        const SizedBox(width: 12),
        FloatingActionButton(
          heroTag: 'start-session',
          onPressed: onStartSession,
          child: const Icon(Icons.play_arrow_rounded),
        ),
      ],
    );
  }
}
