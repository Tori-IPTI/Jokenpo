
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/pages/diputa_page.dart';


class DisputaRobot {

  Future clicarFight(tester) async {
    final result = find.textContaining("Voltar");
    expect(result, findsOneWidget);
    await tester.tap(result);
    await tester.pumpAndSettle();
  }
  
  Future verificaCarregamentoDeDisputa(tester) async {
    final result = find.byType(DisputaPage);
    expect(result, findsOneWidget);
  }

 Future verificaMensagem(tester) async {
    final result = find.byKey(const Key("disputa_mensagem"));
    expect(result, findsOneWidget);
  }
  

}
