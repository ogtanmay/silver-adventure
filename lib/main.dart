import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/state/app_state.dart';
import 'core/theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'services/bootstrap_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BootstrapService.initialize();
  runApp(const ProviderScope(child: GrindOsApp()));
}

class GrindOsApp extends ConsumerWidget {
  const GrindOsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);

    return MaterialApp(
      title: 'GrindOS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(amoldBoost: appState.grindModeEnabled),
      home: const HomeScreen(),
    );
  }
}
