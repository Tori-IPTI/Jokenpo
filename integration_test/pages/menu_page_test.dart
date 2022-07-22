import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jokenpo/app_widget.dart';
import 'package:jokenpo/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("failing test example", (WidgetTester tester) async {
    // Arrange
    runApp(const AppWidget(
      rotaInicial: '/',
    ));
    await tester.pumpAndSettle();
    // Act

    // Assert
    final resultSearch = find.widgetWithText(ElevatedButton, "Jogar");

    expect(resultSearch, findsOneWidget);

    await tester.tap(resultSearch);

    await tester.pumpAndSettle();

    await tester.pump(const Duration(seconds: 5));

    final option = find.byKey(const Key("OPTION_PEDRA"));
    await tester.tap(option);

    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 5));

    final result = find.textContaining("Fight");
    expect(result, findsOneWidget);
  });
  testWidgets("failing test example", (WidgetTester tester) async {
    // Arrange
    runApp(const AppWidget(
      rotaInicial: '/',
    ));
    await tester.pumpAndSettle();
    // Act
    // await tester.pumpWidget(page);

    // Assert
    final resultSearch = find.widgetWithText(ElevatedButton, "Regras");

    expect(resultSearch, findsOneWidget);

    await tester.tap(resultSearch);

    await tester.pumpAndSettle();

    await tester.pump(const Duration(seconds: 5));

    final result = find.textContaining("Regras");

    expect(result, findsOneWidget);
  });
  testWidgets("failing test example", (WidgetTester tester) async {
    // Arrange
    runApp(const AppWidget(
      rotaInicial: '/',
    ));
    await tester.pumpAndSettle();
    // Act
    // await tester.pumpWidget(page);

    // Assert
    final resultSearch = find.widgetWithText(ElevatedButton, "Regras");

    expect(resultSearch, findsOneWidget);

    await tester.tap(resultSearch);

    await tester.pumpAndSettle();

    await tester.pump(const Duration(seconds: 5));

    final result = find.textContaining("Regras");

    expect(result, findsOneWidget);
  });
  testWidgets("failing test example", (WidgetTester tester) async {
    // Arrange
    runApp(const AppWidget(
      rotaInicial: '/',
    ));
    await tester.pumpAndSettle();
    // Act

    // Assert
    final resultSearch = find.widgetWithText(ElevatedButton, "Placar");

    expect(resultSearch, findsOneWidget);

    await tester.tap(resultSearch);

    await tester.pumpAndSettle();

    await tester.pump(const Duration(seconds: 5));

    final result = find.textContaining("vitórias");

    expect(result, findsOneWidget);
  });
}
