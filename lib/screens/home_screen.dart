import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../animations/floating_layer.dart';
import '../core/state/app_state.dart';
import '../focus_mode/focus_mode_controller.dart';
import '../widgets/dynamic_island_alert.dart';
import '../widgets/floating_quick_actions.dart';
import '../widgets/focus_toggle_card.dart';
import '../widgets/goal_ring_widget.dart';
import '../widgets/productivity_summary_widget.dart';
import '../widgets/streak_widget.dart';
import '../widgets/xp_progress_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _navIndex = 0;

  @override
  void initState() {
    super.initState();
    Future<void>.microtask(
      () => ref.read(appStateProvider.notifier).refreshOfflineFirst(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(appStateProvider);
    final focusState = ref.watch(focusModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GrindOS'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: (value) => setState(() => _navIndex = value),
            children: <Widget>[
              _DashboardPanel(
                now: DateTime.now(),
                appState: appState,
                focusEnabled: focusState.enabled,
                onToggleFocus: (enabled) {
                  ref.read(focusModeProvider.notifier).setEnabled(enabled);
                  ref.read(appStateProvider.notifier).setGrindMode(enabled);
                },
              ),
              _InsightsPanel(insights: appState.aiInsights),
            ],
          ),
          Positioned(
            top: 12,
            left: 0,
            right: 0,
            child: DynamicIslandAlert(
              message: appState.grindModeEnabled
                  ? 'Grind Mode active • distractions minimized'
                  : 'Mission ready • keep streak alive',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingQuickActions(
        onAddTask: () => ref.read(appStateProvider.notifier).completeTask(xp: 80),
        onStartSession: () => ref.read(appStateProvider.notifier).completeTask(),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _navIndex,
        onDestinationSelected: (value) => setState(() => _navIndex = value),
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.dashboard_customize_outlined),
            selectedIcon: Icon(Icons.dashboard_customize),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_graph_outlined),
            selectedIcon: Icon(Icons.auto_graph),
            label: 'Insights',
          ),
        ],
      ),
    );
  }
}

class _DashboardPanel extends StatelessWidget {
  const _DashboardPanel({
    required this.now,
    required this.appState,
    required this.focusEnabled,
    required this.onToggleFocus,
  });

  final DateTime now;
  final AppState appState;
  final bool focusEnabled;
  final ValueChanged<bool> onToggleFocus;

  @override
  Widget build(BuildContext context) {
    final goals = appState.goals;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 100),
        children: <Widget>[
          FloatingLayer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Text('Future productivity OS dashboard'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          XpProgressWidget(progress: appState.progress),
          const SizedBox(height: 12),
          FocusToggleCard(enabled: focusEnabled, onChanged: onToggleFocus),
          const SizedBox(height: 12),
          StreakWidget(streak: appState.streak),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: goals.map((goal) => SizedBox(width: 170, child: GoalRingWidget(goal: goal))).toList(),
          ),
          const SizedBox(height: 12),
          const ProductivitySummaryWidget(focusScore: 88, deepWorkHours: 23.5),
        ],
      ),
    );
  }
}

class _InsightsPanel extends StatelessWidget {
  const _InsightsPanel({required this.insights});

  final List<String> insights;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 100),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.psychology_alt_outlined),
              title: Text(insights[index]),
              subtitle: const Text('AI planner / burnout detection / adaptive tasks'),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemCount: insights.length,
      ),
    );
  }
}
