import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/core/jogo.dart';
import 'package:jokenpo/core/status_jogo.dart';
import 'package:jokenpo/pages/diputa_page.dart';
import 'package:mockingjay/mockingjay.dart';

class MockJogo extends Mock implements Jogo {
  get context => null;
}

void main() {
  testWidgets("When DisputaPage builds then show elements",
      (WidgetTester tester) async {
    //Arrange
    final jogoMock = MockJogo();
    const symbolPlayer = "*";
    const symbolSeverino = "#";
    const assetPlayer = "assets/pedra.png";
    final String result;

    when(() => jogoMock.iniciar(symbolPlayer, symbolSeverino));
    //when(() => jogoMock.context.watch<Jogo>(DisputaArguments(
    //    assetPlayer: assetPlayer,
    //    symbolPlayer: symbolPlayer))).thenReturn(symbolPlayer);
    const page = MaterialApp(
      home: DisputaPage(),
    );
    //Act
    await tester.pumpWidget(page);
    //Assert
    //expect(find.byKey(const Key('TITLE_PAGE')), findsOneWidget);
    expect(find.text("Disputa"), findsOneWidget);
    //expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
