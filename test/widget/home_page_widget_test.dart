import 'package:flutter/material.dart';
import 'package:flutter_cl/app.dart';
import 'package:flutter_cl/pages/home/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Increment Counter on HomePage', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    await tester.tap(find.byIcon(Icons.plus_one));
    await tester.tap(find.byIcon(Icons.plus_one));
    await tester.pump();
    expect(find.text('1'), findsNothing);
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('Change Title on HomePage', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    var title = find.byKey(const Key('title')).evaluate().single.widget as Text;
    expect(find.byType(HomePage), findsOneWidget);
    expect(title.data, equals('Home'));
    await tester.enterText(find.byKey(const Key('inputTitle')), 'Home Page');
    await tester.pumpAndSettle();
    title = find.byKey(const Key('title')).evaluate().single.widget as Text;
    expect(title.data, equals("Home Page"));
  });
}
