import 'package:flutter/material.dart';
import 'package:flutter_cl/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Home Page E2E Test', () {
    testWidgets('Clique 5x no FAB Incrementar', (WidgetTester tester) async {
      await app.main();
      await tester.pumpAndSettle();
      for (var i = 0; i < 5; i++) {
        await tester.tap(find.byIcon(Icons.plus_one));
        await Future.delayed(const Duration(seconds: 1), () => null);
      }
      await tester.pumpAndSettle();
      expect(find.text('5'), findsOneWidget);
    });
  });

  testWidgets('Escreva no campo de texto para alterar o titulo da pagina',
      (WidgetTester tester) async {
    await app.main();
    await tester.pumpAndSettle();
    var title = find.byKey(const Key('title')).evaluate().single.widget as Text;
    expect(title.data, equals('Home'));
    await Future.delayed(const Duration(seconds: 2), () => null);
    await tester.enterText(find.byKey(const Key('inputTitle')), 'Home Page');
    await Future.delayed(const Duration(seconds: 2), () => null);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2), () => null);
    title = find.byKey(const Key('title')).evaluate().single.widget as Text;
    expect(title.data, equals('Home Page'));
  });
}
