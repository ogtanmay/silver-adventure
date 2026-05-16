# GrindOS

Futuristic gamified productivity operating system app built with **Flutter + Dart**.

## Implemented foundation

- AMOLED dark futuristic dashboard with glassmorphism cards
- Riverpod-powered app state for XP, streaks, goals, achievements and focus mode
- Offline-first data flow with local cache (`Hive`) and Firebase sync abstraction
- Gamification engine: XP leveling, rank ladder (Bronze → Mythic), combo multiplier
- Focus mode toggle with allowed-apps session concept
- Goal rings, analytics panel, AI insight panel, dynamic island style alert
- Clean scalable architecture:

```text
lib/
 ├── core/
 ├── screens/
 ├── widgets/
 ├── animations/
 ├── focus_mode/
 ├── gamification/
 ├── ai/
 ├── services/
 ├── models/
 └── utils/
```

## Tech stack

- Flutter (Dart)
- Firebase (`firebase_core`) abstraction included
- Hive local storage for offline-first behavior
- Riverpod state management
- Lottie + Rive packages added for premium animations integration

## Run

```bash
flutter pub get
flutter run
```

## Test

```bash
flutter test
```
