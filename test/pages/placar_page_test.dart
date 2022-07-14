import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/core/jogo.dart';
import 'package:jokenpo/pages/placar_page.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockJogo extends Mock implements Jogo {}

void main() {
  testWidgets("When RegrasPage builds then show elements",
      (WidgetTester tester) async {
    final jogoMock = MockJogo();

    when(() => jogoMock.partidas).thenReturn(0);
    when(() => jogoMock.empates).thenReturn(0);
    when(() => jogoMock.vitorias).thenReturn(0);
    when(() => jogoMock.derrotas).thenReturn(0);

    //Arrange
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
      find.textContaining(
        //textContaining procura o texto parcialmente
        "As nossas partidas jogadas",
      ),
      findsOneWidget,
    );
    expect(find.byType(ElevatedButton), findsNWidgets(3));
  });
}
