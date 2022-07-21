import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/core/jogo.dart';
import 'package:jokenpo/core/severino.dart';
import 'package:jokenpo/core/status_jogo.dart';
import 'package:jokenpo/pages/diputa_page.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:provider/provider.dart';

class MockJogo extends Mock implements Jogo {}

class MockDisputaArguments extends Mock implements DisputaArguments {}

class MockSeverino extends Mock implements Severino {}

void main() {
  test("Tetsand0 hash", () {
    final args = DisputaArguments(assetPlayer: "", symbolPlayer: "");

    // args.hashCode
    expect(args.hashCode, equals("".hashCode ^ "".hashCode));
  });
  testWidgets("When DisputaPage arguments are null then",
      (WidgetTester tester) async {
    //Arrange
    final jogoMock = MockJogo();
    final argsMock = MockDisputaArguments();
    final severinoMock = MockSeverino();
    const symbolPlayer = "*";
    const assetPlayer = "assets/pedra.png";

    when(() => argsMock.assetPlayer).thenReturn(assetPlayer);
    when(() => argsMock.symbolPlayer).thenReturn(symbolPlayer);
    when(() => severinoMock.jogar()).thenReturn("%");

    final page = MultiProvider(
      providers: [
        Provider<Jogo>(create: (_) => jogoMock),
        Provider<Severino>(create: (_) => severinoMock)
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          final newSettings = settings.copyWith(
            arguments: argsMock,
          );

          return MaterialPageRoute<void>(
            settings: newSettings,
            builder: (BuildContext context) => const DisputaPage(),
          );
        },
      ),
    );

    //Act
    await tester.pumpWidget(page);

    //Assert

    //expect(find.byKey(const Key('TITLE_PAGE')), findsOneWidget);
    expect(find.text("Disputa"), findsOneWidget);
    //expect(find.byType(ElevatedButton), findsOneWidget);
  });
  testWidgets("When DisputaPage build then", (WidgetTester tester) async {
    //Arrange
    final jogoMock = MockJogo();
    final severinoMock = MockSeverino();
    final argsMock = MockDisputaArguments();
    const symbolPlayer = "*";
    const assetPlayer = "assets/pedra.png";

    when(() => argsMock.assetPlayer).thenReturn(assetPlayer);
    when(() => argsMock.symbolPlayer).thenReturn(symbolPlayer);
    when(() => severinoMock.jogar()).thenReturn("%");

    final page = MultiProvider(
      providers: [
        Provider<Jogo>(create: (_) => jogoMock),
        Provider<Severino>(create: (_) => severinoMock)
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          final newSettings = settings.copyWith(
            arguments: argsMock,
          );

          return MaterialPageRoute<void>(
            settings: newSettings,
            builder: (BuildContext context) => const DisputaPage(),
          );
        },
      ),
    );

    //Act
    await tester.pumpWidget(page);

    //Assert
    expect(find.text("Disputa"), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
  testWidgets("When tap elevatedbutton are tapped and the player ",
      (widgetTester) async {
    //Arrange
    final jogoMock = MockJogo();
    final severinoMock = MockSeverino();
    final argsMock = MockDisputaArguments();
    const symbolPlayer = "*";
    const assetPlayer = "assets/pedra.png";

    when(() => argsMock.assetPlayer).thenReturn(assetPlayer);
    when(() => argsMock.symbolPlayer).thenReturn(symbolPlayer);
    when(() => severinoMock.jogar()).thenReturn("#");
    when(() => jogoMock.iniciar(any(), any())).thenReturn(StatusJogo.derrota);

    final page = MultiProvider(
      providers: [
        Provider<Jogo>(create: (_) => jogoMock),
        Provider<Severino>(create: (_) => severinoMock)
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          final newSettings = settings.copyWith(
            arguments: argsMock,
          );

          return MaterialPageRoute<void>(
            settings: newSettings,
            builder: (BuildContext context) => const DisputaPage(),
          );
        },
      ),
    );
    await widgetTester.pumpWidget(page);
    final button = find.byType(ElevatedButton);
    //Act
    await widgetTester.tap(button);
    await widgetTester.pump();

    //Assert

    expect(find.text("Você perdeu, mané"), findsOneWidget);
    expect(find.byKey(const Key("iniciar")), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
  testWidgets("When tap elevatedbutton are tapped and the player wins",
      (widgetTester) async {
    //Arrange
    final jogoMock = MockJogo();
    final severinoMock = MockSeverino();
    final argsMock = MockDisputaArguments();
    const symbolPlayer = "*";
    const assetPlayer = "assets/pedra.png";

    when(() => argsMock.assetPlayer).thenReturn(assetPlayer);
    when(() => argsMock.symbolPlayer).thenReturn(symbolPlayer);
    when(() => severinoMock.jogar()).thenReturn("%");
    when(() => jogoMock.iniciar(any(), any())).thenReturn(StatusJogo.vitoria);

    final page = MultiProvider(
      providers: [
        Provider<Jogo>(create: (_) => jogoMock),
        Provider<Severino>(create: (_) => severinoMock)
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          final newSettings = settings.copyWith(
            arguments: argsMock,
          );

          return MaterialPageRoute<void>(
            settings: newSettings,
            builder: (BuildContext context) => const DisputaPage(),
          );
        },
      ),
    );
    await widgetTester.pumpWidget(page);
    final button = find.byType(ElevatedButton);
    //Act
    await widgetTester.tap(button);
    await widgetTester.pump();

    //Assert

    expect(find.text("Você venceu!"), findsOneWidget);
    expect(find.byKey(const Key("iniciar")), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets(
    "When tap elevatedbutton are tapped and the player and Severino is equal",
    (widgetTester) async {
      //Arrange
      final jogoMock = MockJogo();
      final severinoMock = MockSeverino();
      final argsMock = MockDisputaArguments();
      const symbolPlayer = "*";
      const assetPlayer = "assets/pedra.png";

      when(() => argsMock.assetPlayer).thenReturn(assetPlayer);
      when(() => argsMock.symbolPlayer).thenReturn(symbolPlayer);
      when(() => severinoMock.jogar()).thenReturn("*");
      when(() => jogoMock.iniciar(any(), any())).thenReturn(StatusJogo.empate);

      final page = MultiProvider(
        providers: [
          Provider<Jogo>(create: (_) => jogoMock),
          Provider<Severino>(create: (_) => severinoMock)
        ],
        child: MaterialApp(
          onGenerateRoute: (settings) {
            final newSettings = settings.copyWith(
              arguments: argsMock,
            );

            return MaterialPageRoute<void>(
              settings: newSettings,
              builder: (BuildContext context) => const DisputaPage(),
            );
          },
        ),
      );
      await widgetTester.pumpWidget(page);
      final button = find.byType(ElevatedButton);
      //Act
      await widgetTester.tap(button);
      await widgetTester.pump();

      //Assert
      expect(find.text("Ops! empatou"), findsOneWidget);
      expect(find.byKey(const Key("iniciar")), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    },
  );
}
