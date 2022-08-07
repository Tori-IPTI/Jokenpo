import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/app_widget.dart';
import 'package:jokenpo/pages/escolha_page.dart';

class EscolhaRobot {
  Future abraPaginaEscolha(tester) async {
    runApp(const AppWidget(
      rotaInicial: '/escolha',
    ));
    await tester.pumpAndSettle();
  }

  Future escolhaPedra(tester) async {
    final option = find.byKey(const Key("OPTION_PEDRA"));
    await tester.tap(option);
    await tester.pumpAndSettle();
  }

  Future escolhaPapel(tester) async {
    final option = find.byKey(const Key("OPTION_PAPEL"));
    await tester.tap(option);
    await tester.pumpAndSettle();
  }

  Future escolhaTesoura(tester) async {
    final option = find.byKey(const Key("OPTION_TESOURA"));
    await tester.tap(option);
    await tester.pumpAndSettle();
  }

  Future verificaCarregamentoDeEscolha(tester) async {
    final result = find.byType(EscolhaPage);
    expect(result, findsOneWidget);
  }
}
