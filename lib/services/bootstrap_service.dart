import 'firebase_sync_service.dart';
import 'local_storage_service.dart';

class BootstrapService {
  static Future<void> initialize() async {
    await LocalStorageService.instance.initialize();
    await FirebaseSyncService.instance.initialize();
  }
}
