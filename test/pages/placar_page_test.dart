import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/core/jogo.dart';
import 'package:jokenpo/pages/diputa_page.dart';
import 'package:jokenpo/pages/escolha_page.dart';
import 'package:jokenpo/pages/placar_page.dart';
import 'package:jokenpo/pages/regras_page.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockJogo extends Mock implements Jogo {}


void main() {
  testWidgets("When RegrasPage builds then show elements",
      (WidgetTester tester) async {
    //Arrange
    final jogoMock = MockJogo();
    const qtdPartidas = 10;
    when(() => jogoMock.partidas).thenReturn(qtdPartidas);
    when(() => jogoMock.empates).thenReturn(0);
    when(() => jogoMock.vitorias).thenReturn(0);
    when(() => jogoMock.derrotas).thenReturn(0);

    final page = Provider<Jogo>(
      create: (_) => jogoMock,
      child: const MaterialApp(
        home: PlacarPage(),
      ),
    );
    //Act
    await tester.pumpWidget(page);

    //Assert

    expect(
      find.text(
        //textContaining procura o texto parcialmente
        "As nossas partidas jogadas: $qtdPartidas",
      ),
      findsOneWidget,
    );
    expect(find.byType(ElevatedButton), findsNWidgets(3));
  });
  testWidgets("When RegrasPage show the values then verify",
      (WidgetTester tester) async {
    //Arrange
    final jogoMock = MockJogo();
    const qtdPartidas = 0;
    const qtdEmpates = 0;
    const qtdVitorias = 0;
    const qtdDerrotas = 0;

    when(() => jogoMock.partidas).thenReturn(qtdPartidas);
    when(() => jogoMock.empates).thenReturn(qtdEmpates);
    when(() => jogoMock.vitorias).thenReturn(qtdVitorias);
    when(() => jogoMock.derrotas).thenReturn(qtdDerrotas);
    //Act

    final page = Provider<Jogo>(
      create: (_) => jogoMock,
      child: const MaterialApp(
        home: PlacarPage(),
      ),
    );

    await tester.pumpWidget(page);
    //Assert

    expect(
      find.text(
        //textContaining procura o texto parcialmente
        "As nossas partidas jogadas: $qtdPartidas",
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        //textContaining procura o texto parcialmente
        "Suas vitórias: $qtdVitorias",
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        //textContaining procura o texto parcialmente
        "Suas derrotas: $qtdDerrotas",
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        //textContaining procura o texto parcialmente
        "Seus empates: $qtdEmpates",
      ),
      findsOneWidget,
    );
  });

  testWidgets('Placar Button was taped then navigate to PlacarPage',
        (WidgetTester tester) async {

        final navigatorMock = MockNavigator();
        when(() => navigatorMock.pushReplacementNamed(any())).thenAnswer((_) async {
          return null;
        });
        final page = MaterialApp(
       home: MockNavigatorProvider(
        navigator: navigatorMock,
        child: const EscolhaPage(title: '',),
      ),
    );
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

}
