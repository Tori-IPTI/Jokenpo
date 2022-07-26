import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/app_widget.dart';
import 'package:jokenpo/pages/regras_page.dart';

class RegrasRobot {
  Future abraPaginaRegras(tester) async {
    runApp(const AppWidget(
      rotaInicial: '/regras',
    ));
    await tester.pumpAndSettle();
  }

  Future escolhaJogar(tester) async {
    final resultSearch = find.widgetWithText(ElevatedButton, "Jogar");
    expect(resultSearch, findsOneWidget);
    await tester.tap(resultSearch);
    await tester.pumpAndSettle();
  }

  Future escolhaPlacar(tester) async {
    final resultSearch = find.widgetWithText(ElevatedButton, "Placar");
    expect(resultSearch, findsOneWidget);
    await tester.tap(resultSearch);
    await tester.pumpAndSettle();
  }

  Future verificaCarregamentoDeRegras(tester) async {
    final result = find.byType(RegrasPage);
    expect(result, findsOneWidget);
  }
}
