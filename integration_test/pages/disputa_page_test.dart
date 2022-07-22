import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jokenpo/app_widget.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("failing test example", (WidgetTester tester) async {
    // Arrange
    runApp(const AppWidget(
      rotaInicial: "/escolha",
    ));
    await tester.pumpAndSettle();
    // Act

    // Assert
    final option = find.byKey(const Key("OPTION_PEDRA"));
    await tester.tap(option);

    await tester.pumpAndSettle();
    // await tester.pump(const Duration(seconds: 5));

    final result = find.textContaining("Voltar");
    expect(result, findsOneWidget);
    await tester.tap(result);

    await tester.pumpAndSettle();
    // await tester.pump(const Duration(seconds: 5));

    final pagina = find.textContaining("Fight");
    expect(pagina, findsOneWidget);
  });
}
