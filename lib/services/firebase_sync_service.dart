import 'package:firebase_core/firebase_core.dart';

class FirebaseSyncService {
  FirebaseSyncService._();

  static final FirebaseSyncService instance = FirebaseSyncService._();

  bool _initialized = false;

  bool get initialized => _initialized;

  Future<void> initialize() async {
    try {
      await Firebase.initializeApp();
      _initialized = true;
    } catch (_) {
      _initialized = false;
    }
  }

  Future<void> syncPayload(Map<String, dynamic> payload) async {
    if (!_initialized) return;
    payload;
  }
}
