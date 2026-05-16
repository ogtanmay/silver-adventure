import '../models/user_progress.dart';

class XpEngine {
  const XpEngine();

  UserProgress awardXp(UserProgress progress, int rawXp) {
    final earned = (rawXp * progress.comboMultiplier).round();
    final totalXp = progress.currentXp + earned;
    final threshold = progress.nextLevelXp;
    if (totalXp < threshold) {
      return progress.copyWith(currentXp: totalXp);
    }

    final nextLevel = progress.level + 1;
    final remainder = totalXp - threshold;
    final nextThreshold = threshold + 150;

    return progress.copyWith(
      level: nextLevel,
      currentXp: remainder,
      nextLevelXp: nextThreshold,
      rank: _rankFromLevel(nextLevel),
    );
  }

  String _rankFromLevel(int level) {
    if (level >= 30) return 'Mythic';
    if (level >= 20) return 'Diamond';
    if (level >= 12) return 'Gold';
    if (level >= 6) return 'Silver';
    return 'Bronze';
  }
}
