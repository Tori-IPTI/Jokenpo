import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jokenpo/app_widget.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("failing test example", (WidgetTester tester) async {
    // Arrange
    runApp(const AppWidget(
      rotaInicial: "/regras",
    ));
    await tester.pumpAndSettle();
    // Act
    final resultSearch = find.widgetWithText(ElevatedButton, "Jogar");

    expect(resultSearch, findsOneWidget);

    await tester.tap(resultSearch);

    await tester.pumpAndSettle();

    await tester.pump(const Duration(seconds: 5));

    final option = find.byKey(const Key("OPTION_PEDRA"));
    await tester.tap(option);

    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 5));
    // Assert

    final result = find.textContaining("Fight");
    expect(result, findsOneWidget);
  });
}
