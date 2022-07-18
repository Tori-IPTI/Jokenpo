import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/pages/menu_page.dart';
import 'package:mockingjay/mockingjay.dart';

void main() {
  testWidgets("When MenuPage builds then show elements",
      (WidgetTester tester) async {
    //Arrange
    const page = MaterialApp(
      home: MenuPage(),
    );

    //Act
    await tester.pumpWidget(page);

    //Assert
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
        child: const MenuPage(),
      ),
    );
    testWidgets('Jogar button was taped then navigate to EscolhaPage',
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
    testWidgets('Jogar button was taped then navigate to RegrasPage',
        (WidgetTester tester) async {
      //Arrange

      //Act
      await tester.pumpWidget(page);
      //Assert
      final resultSearch = find.widgetWithText(ElevatedButton, "Regras");

      expect(resultSearch, findsOneWidget);

      await tester.tap(resultSearch);

      verify(
        () => navigatorMock.pushReplacementNamed('/regras'),
      ).called(1);
    });
    testWidgets('Jogar button was taped then navigate to PlacarPage',
        (WidgetTester tester) async {
      //Arrange

      //Act
      await tester.pumpWidget(page);
      //Assert
      final resultSearch = find.widgetWithText(ElevatedButton, "Placar");

      expect(resultSearch, findsOneWidget);

      await tester.tap(resultSearch);

      verify(
        () => navigatorMock.pushReplacementNamed('/placar'),
      ).called(1);
    });
  });
}
