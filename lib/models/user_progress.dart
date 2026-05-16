class UserProgress {
  const UserProgress({
    required this.level,
    required this.currentXp,
    required this.nextLevelXp,
    required this.rank,
    required this.comboMultiplier,
  });

  final int level;
  final int currentXp;
  final int nextLevelXp;
  final String rank;
  final double comboMultiplier;

  double get progress =>
      nextLevelXp == 0 ? 0 : (currentXp / nextLevelXp).clamp(0, 1);

  UserProgress copyWith({
    int? level,
    int? currentXp,
    int? nextLevelXp,
    String? rank,
    double? comboMultiplier,
  }) {
    return UserProgress(
      level: level ?? this.level,
      currentXp: currentXp ?? this.currentXp,
      nextLevelXp: nextLevelXp ?? this.nextLevelXp,
      rank: rank ?? this.rank,
      comboMultiplier: comboMultiplier ?? this.comboMultiplier,
    );
  }
}
