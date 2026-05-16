import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ai/ai_productivity_service.dart';
import '../../focus_mode/focus_mode_controller.dart';
import '../../gamification/xp_engine.dart';
import '../../models/achievement.dart';
import '../../models/goal.dart';
import '../../models/streak_data.dart';
import '../../models/user_progress.dart';
import '../../services/productivity_repository.dart';
import '../../utils/mock_data.dart';

class AppState {
  const AppState({
    required this.progress,
    required this.streak,
    required this.goals,
    required this.achievements,
    required this.aiInsights,
    required this.grindModeEnabled,
  });

  final UserProgress progress;
  final StreakData streak;
  final List<Goal> goals;
  final List<Achievement> achievements;
  final List<String> aiInsights;
  final bool grindModeEnabled;

  AppState copyWith({
    UserProgress? progress,
    StreakData? streak,
    List<Goal>? goals,
    List<Achievement>? achievements,
    List<String>? aiInsights,
    bool? grindModeEnabled,
  }) {
    return AppState(
      progress: progress ?? this.progress,
      streak: streak ?? this.streak,
      goals: goals ?? this.goals,
      achievements: achievements ?? this.achievements,
      aiInsights: aiInsights ?? this.aiInsights,
      grindModeEnabled: grindModeEnabled ?? this.grindModeEnabled,
    );
  }
}

class AppStateNotifier extends Notifier<AppState> {
  late final ProductivityRepository _repository;
  final XpEngine _xpEngine = const XpEngine();
  final AiProductivityService _ai = const AiProductivityService();

  @override
  AppState build() {
    _repository = ProductivityRepository();

    return AppState(
      progress: mockProgress,
      streak: mockStreak,
      goals: mockGoals,
      achievements: mockAchievements,
      aiInsights: _ai.generateInsights(goals: mockGoals, streak: mockStreak),
      grindModeEnabled: false,
    );
  }

  Future<void> refreshOfflineFirst() async {
    final progress = await _repository.loadProgress();
    final streak = await _repository.loadStreak();
    final goals = await _repository.loadGoals();

    state = state.copyWith(
      progress: progress,
      streak: streak,
      goals: goals,
      aiInsights: _ai.generateInsights(goals: goals, streak: streak),
    );
  }

  Future<void> completeTask({int xp = 120}) async {
    final updated = _xpEngine.awardXp(state.progress, xp);
    state = state.copyWith(progress: updated);
    await _repository.saveProgress(updated);
  }

  void setGrindMode(bool enabled) {
    state = state.copyWith(grindModeEnabled: enabled);
  }

  void bindFocusState(WidgetRef ref) {
    ref.listen<FocusModeState>(focusModeProvider, (_, next) {
      setGrindMode(next.enabled);
    });
  }
}

final appStateProvider = NotifierProvider<AppStateNotifier, AppState>(
  AppStateNotifier.new,
);
