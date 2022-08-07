import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/app_widget.dart';
import 'package:jokenpo/pages/placar_page.dart';


class PlacarRobot {
  Future abraPaginaPlacar(tester) async {
    runApp(const AppWidget(
      rotaInicial: '/placar',
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
  Future verificaCarregamentoDePlacar(tester) async {
    final result = find.byType(PlacarPage);
    expect(result, findsOneWidget);
  }
}
