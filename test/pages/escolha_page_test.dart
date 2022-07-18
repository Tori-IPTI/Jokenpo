import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/core/jogo.dart';
import 'package:jokenpo/pages/escolha_page.dart';
import 'package:jokenpo/pages/regras_page.dart';
import 'package:mocktail/mocktail.dart';

class MockJogo extends Mock implements Jogo {}

void main(List<String> args) {
  testWidgets("When EscolhaPage builds then show elements",
      (WidgetTester tester) async {
    const title = "Jokenpo";
    //Arrange
    /*const page = MaterialApp(
      home: EscolhaPage(title),
    )*/

    //Act

    //Assert
  });
}
//flutter run --profile abrir gráficos de eficiencia