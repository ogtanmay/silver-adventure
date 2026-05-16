class FocusSession {
  const FocusSession({
    required this.minutes,
    required this.allowedApps,
    required this.blockedApps,
  });

  final int minutes;
  final List<String> allowedApps;
  final int blockedApps;
}
