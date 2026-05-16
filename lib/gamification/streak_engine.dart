import '../models/streak_data.dart';

class StreakEngine {
  const StreakEngine();

  StreakData recoverDailyStreak(StreakData streak) {
    return StreakData(
      daily: streak.daily + 1,
      study: streak.study,
      workout: streak.workout,
      sleep: streak.sleep,
      focus: streak.focus,
    );
  }
}
