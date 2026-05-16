class Goal {
  const Goal({
    required this.id,
    required this.title,
    required this.target,
    required this.completed,
    required this.period,
  });

  final String id;
  final String title;
  final int target;
  final int completed;
  final GoalPeriod period;

  double get ratio => target == 0 ? 0 : (completed / target).clamp(0, 1);
}

enum GoalPeriod { daily, weekly, monthly, exam }
