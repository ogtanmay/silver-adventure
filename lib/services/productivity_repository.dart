import '../models/goal.dart';
import '../models/streak_data.dart';
import '../models/user_progress.dart';
import '../utils/mock_data.dart';
import 'firebase_sync_service.dart';
import 'local_storage_service.dart';

class ProductivityRepository {
  ProductivityRepository({
    LocalStorageService? local,
    FirebaseSyncService? remote,
  })  : _local = local ?? LocalStorageService.instance,
        _remote = remote ?? FirebaseSyncService.instance;

  final LocalStorageService _local;
  final FirebaseSyncService _remote;

  Future<UserProgress> loadProgress() async {
    final cached = _local.get<Map<dynamic, dynamic>>('progress');
    if (cached == null) return mockProgress;

    return UserProgress(
      level: cached['level'] as int,
      currentXp: cached['currentXp'] as int,
      nextLevelXp: cached['nextLevelXp'] as int,
      rank: cached['rank'] as String,
      comboMultiplier: (cached['comboMultiplier'] as num).toDouble(),
    );
  }

  Future<void> saveProgress(UserProgress progress) async {
    final payload = <String, dynamic>{
      'level': progress.level,
      'currentXp': progress.currentXp,
      'nextLevelXp': progress.nextLevelXp,
      'rank': progress.rank,
      'comboMultiplier': progress.comboMultiplier,
    };

    await _local.set('progress', payload);
    await _remote.syncPayload(payload);
  }

  Future<List<Goal>> loadGoals() async => mockGoals;

  Future<StreakData> loadStreak() async => mockStreak;
}
