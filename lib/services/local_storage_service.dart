import 'dart:collection';

import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  LocalStorageService._();

  static final LocalStorageService instance = LocalStorageService._();

  static const _boxName = 'grindos_cache';
  Box<dynamic>? _box;
  final Map<String, dynamic> _memoryFallback = HashMap<String, dynamic>();

  Future<void> initialize() async {
    try {
      await Hive.initFlutter();
      _box = await Hive.openBox<dynamic>(_boxName);
    } catch (_) {
      _box = null;
    }
  }

  T? get<T>(String key) {
    final value = _box?.get(key) ?? _memoryFallback[key];
    if (value is T) return value;
    return null;
  }

  Future<void> set<T>(String key, T value) async {
    _memoryFallback[key] = value;
    await _box?.put(key, value);
  }
}
