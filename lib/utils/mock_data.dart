import '../models/achievement.dart';
import '../models/goal.dart';
import '../models/streak_data.dart';
import '../models/user_progress.dart';

const mockProgress = UserProgress(
  level: 8,
  currentXp: 560,
  nextLevelXp: 900,
  rank: 'Silver',
  comboMultiplier: 1.4,
);

const mockStreak = StreakData(
  daily: 14,
  study: 11,
  workout: 5,
  sleep: 6,
  focus: 7,
);

const mockGoals = <Goal>[
  Goal(
    id: 'd1',
    title: 'Deep Work Sessions',
    target: 4,
    completed: 2,
    period: GoalPeriod.daily,
  ),
  Goal(
    id: 'w1',
    title: 'Weekly Study Hours',
    target: 35,
    completed: 19,
    period: GoalPeriod.weekly,
  ),
  Goal(
    id: 'm1',
    title: 'Monthly Revision Targets',
    target: 30,
    completed: 17,
    period: GoalPeriod.monthly,
  ),
  Goal(
    id: 'e1',
    title: 'JEE Mock Tests',
    target: 12,
    completed: 6,
    period: GoalPeriod.exam,
  ),
];

const mockAchievements = <Achievement>[
  Achievement(
    title: 'Backlog Killer',
    unlocked: true,
    description: 'Cleared all pending tasks for 3 days.',
  ),
  Achievement(
    title: 'Night Grinder',
    unlocked: true,
    description: 'Completed 5 focus sessions after 10 PM.',
  ),
  Achievement(
    title: 'Focus God',
    unlocked: false,
    description: 'Hold a 14-day focus streak.',
  ),
];
