import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grindos/main.dart';

void main() {
  testWidgets('GrindOS dashboard renders key widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: GrindOsApp()));
    await tester.pumpAndSettle();

    expect(find.text('GrindOS'), findsOneWidget);
    expect(find.text('Focus Mode'), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsWidgets);
  });

  testWidgets('Focus toggle is interactive', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: GrindOsApp()));
    await tester.pumpAndSettle();

    final switchFinder = find.byType(Switch);
    expect(switchFinder, findsOneWidget);

    Switch before = tester.widget<Switch>(switchFinder);
    final initialValue = before.value;

    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    final Switch after = tester.widget<Switch>(switchFinder);
    expect(after.value, isNot(initialValue));
  });
}
