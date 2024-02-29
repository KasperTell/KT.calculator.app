import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kt_calculator/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test add', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tapButton(tester, '1');
    await tapButton(tester, '2');
    await tapButton(tester, 'Enter');
    await tapButton(tester, '3');
    await tapButton(tester, '+');
    await tapButton(tester, 'Enter');

    await tester.pumpAndSettle();

    expect(find.text("15 "), findsOneWidget);
  });

  testWidgets('Test subtract', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tapButton(tester, 'Clear');
    await tapButton(tester, '2');
    await tapButton(tester, '1');
    await tapButton(tester, 'Enter');
    await tapButton(tester, '1');
    await tapButton(tester, '1');
    await tapButton(tester, '-');
    await tapButton(tester, 'Enter');

    await tester.pumpAndSettle();

    expect(find.text("10 "), findsOneWidget);
  });

  testWidgets('Test multiply', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tapButton(tester, 'Clear');
    await tapButton(tester, '1');
    await tapButton(tester, 'Enter');
    await tapButton(tester, '2');
    await tapButton(tester, '*');
    await tapButton(tester, 'Enter');

    await tester.pumpAndSettle();

    expect(find.text("2 "), findsOneWidget);
  });

  testWidgets('Test divide', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tapButton(tester, 'Clear');
    await tapButton(tester, '1');
    await tapButton(tester, '0');
    await tapButton(tester, 'Enter');
    await tapButton(tester, '2');
    await tapButton(tester, '/');
    await tapButton(tester, 'Enter');

    await tester.pumpAndSettle();

    expect(find.text("5 "), findsOneWidget);
  });
}


Future<void> tapButton(WidgetTester tester, String buttonText) async {
  await tester.tap(find.text(buttonText));
  await tester.pump();
}