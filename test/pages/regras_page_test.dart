import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/pages/regras_page.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Arrange
    const page = MaterialApp(
      home: RegrasPage(),
    );

    // Act
    await tester.pumpWidget(page);

    // Assert
    final resultSearch = find.text('');

    expect(find.byKey(const Key('TITLE_PAGE')), findsOneWidget);
    expect(
      find.text(
        "A tesoura corta o papel, mas quebra com a pedra; o papel embrulha a pedra, mas é cortado pela tesoura e a pedra quebra a tesoura e é embrulhada pelo papel.",
      ),
      findsOneWidget,
    );
    expect(find.byType(ElevatedButton), findsNWidgets(3));
  });
}
