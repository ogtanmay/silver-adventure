import 'package:flutter_riverpod/flutter_riverpod.dart';

class FocusModeState {
  const FocusModeState({
    required this.enabled,
    required this.allowedApps,
    required this.sessionMinutes,
  });

  final bool enabled;
  final List<String> allowedApps;
  final int sessionMinutes;

  FocusModeState copyWith({
    bool? enabled,
    List<String>? allowedApps,
    int? sessionMinutes,
  }) {
    return FocusModeState(
      enabled: enabled ?? this.enabled,
      allowedApps: allowedApps ?? this.allowedApps,
      sessionMinutes: sessionMinutes ?? this.sessionMinutes,
    );
  }
}

class FocusModeController extends Notifier<FocusModeState> {
  @override
  FocusModeState build() {
    return const FocusModeState(
      enabled: false,
      allowedApps: <String>['Calculator', 'Docs', 'Music'],
      sessionMinutes: 45,
    );
  }

  void toggle() {
    state = state.copyWith(enabled: !state.enabled);
  }

  void setEnabled(bool enabled) {
    state = state.copyWith(enabled: enabled);
  }
}

final focusModeProvider = NotifierProvider<FocusModeController, FocusModeState>(
  FocusModeController.new,
);
