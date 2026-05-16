import '../models/goal.dart';
import '../models/streak_data.dart';

class AiProductivityService {
  const AiProductivityService();

  List<String> generateInsights({
    required List<Goal> goals,
    required StreakData streak,
  }) {
    final lowProgress = goals.where((goal) => goal.ratio < 0.4).length;

    return <String>[
      if (lowProgress > 0)
        'Backlog recovery: focus on $lowProgress low-progress targets first.',
      if (streak.focus < 3)
        'Focus score alert: schedule a 45-minute deep work sprint now.',
      if (streak.sleep < 5)
        'Burnout detection: improve sleep streak for stable productivity.',
      'Adaptive mission: complete one high-impact task before 11 AM.',
    ];
  }
}
