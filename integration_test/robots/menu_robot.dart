import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/app_widget.dart';

class MenuRobot {
  Future abraPaginaMenu(tester) async {
    runApp(const AppWidget(
      rotaInicial: '/',
    ));
    await tester.pumpAndSettle();
  }

  Future escolhaJogar(tester) async {
    final resultSearch = find.widgetWithText(ElevatedButton, "Jogar");
    expect(resultSearch, findsOneWidget);
    await tester.tap(resultSearch);
    await tester.pumpAndSettle();
  }

  Future escolhaRegras(tester) async {
    final resultSearch = find.widgetWithText(ElevatedButton, "Regras");
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
}
