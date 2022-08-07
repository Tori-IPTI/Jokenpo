import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/pages/diputa_page.dart';
import 'package:jokenpo/pages/escolha_page.dart';
import 'package:mockingjay/mockingjay.dart';

class ArgumentsMock extends Mock implements DisputaArguments {}

void main() {
  testWidgets("When EscolhaPage builds then show elements",
      (WidgetTester tester) async {
    //Arrange
    const page = MaterialApp(
      home: EscolhaPage(
        title: '',
      ),
    );
    //Act
    await tester.pumpWidget(page);
    //Assert
    expect(find.byKey(const Key('TITLE_PAGE')), findsOneWidget);
    expect(find.text("Jokenpo"), findsOneWidget);
    expect(find.byType(InkWell), findsNWidgets(3));
  });

  group(
    'When',
    () {
      testWidgets("Teste nav", (widgetTester) async {
        final navigatorMock = MockNavigator();
        final args = DisputaArguments(
          assetPlayer: "assets/pedra.png",
          symbolPlayer: "*",
        );

        when(() => navigatorMock.pushReplacement<void, dynamic>(any()))
            .thenAnswer((_) async {});

        final page = MaterialApp(
          home: MockNavigatorProvider(
            navigator: navigatorMock,
            child: const EscolhaPage(title: ''),
          ),
        );

        await widgetTester.pumpWidget(page);

        final option = find.byKey(const Key("OPTION_PEDRA"));
        expect(option, findsOneWidget);
        await widgetTester.tap(option);

        verify(
          () => navigatorMock.pushReplacement<void, dynamic>(
            any<Route<void>>(
              that: isRoute<void>(
                whereName: equals("/disputa"),
                whereArguments: equals(args),
              ),
            ),
          ),
        ).called(1);
      });
      testWidgets("Teste nav", (widgetTester) async {
        final navigatorMock = MockNavigator();
        final args = DisputaArguments(
          assetPlayer: "assets/papel.png",
          symbolPlayer: "#",
        );

        when(() => navigatorMock.pushReplacement<void, dynamic>(any()))
            .thenAnswer((_) async {});

        final page = MaterialApp(
          home: MockNavigatorProvider(
            navigator: navigatorMock,
            child: const EscolhaPage(title: ''),
          ),
        );

        await widgetTester.pumpWidget(page);

        final option = find.byKey(const Key("OPTION_PAPEL"));
        expect(option, findsOneWidget);
        await widgetTester.tap(option);

        verify(
          () => navigatorMock.pushReplacement<void, dynamic>(
            any<Route<void>>(
              that: isRoute<void>(
                whereName: equals("/disputa"),
                whereArguments: equals(args),
              ),
            ),
          ),
        ).called(1);
      });
      testWidgets("Teste nav", (widgetTester) async {
        final navigatorMock = MockNavigator();
        final args = DisputaArguments(
          assetPlayer: "assets/tesoura.png",
          symbolPlayer: "%",
        );

        when(() => navigatorMock.pushReplacement<void, dynamic>(any()))
            .thenAnswer((_) async {});

        final page = MaterialApp(
          home: MockNavigatorProvider(
            navigator: navigatorMock,
            child: const EscolhaPage(title: ''),
          ),
        );

        await widgetTester.pumpWidget(page);

        final option = find.byKey(const Key("OPTION_TESOURA"));
        expect(option, findsOneWidget);
        await widgetTester.tap(option);

        verify(
          () => navigatorMock.pushReplacement<void, dynamic>(
            any<Route<void>>(
              that: isRoute<void>(
                whereName: equals("/disputa"),
                whereArguments: equals(args),
              ),
            ),
          ),
        ).called(1);
      });
    },
  );
}


//flutter run --profile abrir gráficos de eficiencia