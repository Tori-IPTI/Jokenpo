import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/pages/regras_page.dart';
import 'package:mockingjay/mockingjay.dart';

void main() {
  testWidgets('When RegrasPage builds then show elements',
      (WidgetTester tester) async {
    // Arrange
    const page = MaterialApp(
      home: RegrasPage(),
    );

    // Act
    await tester.pumpWidget(page);

    // Assert

    expect(find.byKey(const Key('TITLE_PAGE')), findsOneWidget);
    expect(
      find.text(
        "A tesoura corta o papel, mas quebra com a pedra; o papel embrulha a pedra, mas é cortado pela tesoura e a pedra quebra a tesoura e é embrulhada pelo papel.",
      ),
      findsOneWidget,
    );
    expect(find.byType(ElevatedButton), findsNWidgets(3));
  });

  group("When ", () {
    final navigatorMock = MockNavigator();
    when(() => navigatorMock.pushReplacementNamed(any())).thenAnswer((_) async {
      return null;
    });
    final page = MaterialApp(
      home: MockNavigatorProvider(
        navigator: navigatorMock,
        child: const RegrasPage(),
      ),
    );
    testWidgets('Placar Button was taped then navigate to PlacarPage',
        (WidgetTester tester) async {
      // Arrange

      // Act
      await tester.pumpWidget(page);

      // Assert
      final resultSearch = find.widgetWithText(ElevatedButton, "Placar");

      expect(resultSearch, findsOneWidget);

      await tester.tap(resultSearch);

      verify(
        () => navigatorMock.pushReplacementNamed('/placar'),
      ).called(1);
    });

    testWidgets("Regras Button was taped then navigate to RegrasPage",
        (WidgetTester tester) async {
      //arrange

      // Act
      await tester.pumpWidget(page);

      //Assert
      final resultSearch = find.widgetWithText(ElevatedButton, "Regras");

      expect(resultSearch, findsOneWidget);

      await tester.tap(resultSearch);

      verify(
        () => navigatorMock.pushReplacementNamed('/regras'),
      ).called(1);
    });

    testWidgets("Escolha Button was taped then navigate to EscolhaPage",
        (WidgetTester tester) async {
      //Arrange

      //Act
      await tester.pumpWidget(page);

      //Assert
      final resultSearch = find.widgetWithText(ElevatedButton, "Jogar");

      expect(resultSearch, findsOneWidget);

      await tester.tap(resultSearch);

      verify(
        () => navigatorMock.pushReplacementNamed('/escolha'),
      ).called(1);
    });
  });
}
