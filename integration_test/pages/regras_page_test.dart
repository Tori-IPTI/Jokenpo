import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../robots/escolha_robot.dart';
import '../robots/placar_robot.dart';
import '../robots/regras_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  group("Placar integration test", () {
    late RegrasRobot regrasRobot;
    late PlacarRobot placarRobot;
    late EscolhaRobot escolhaRobot;

    setUpAll(() {
      placarRobot = PlacarRobot();
      escolhaRobot = EscolhaRobot();
      regrasRobot = RegrasRobot();
    });

    testWidgets("when tap PLACAR", (WidgetTester tester) async {
      // Arrange

      // Act
      await regrasRobot.abraPaginaRegras(tester);
      await regrasRobot.escolhaPlacar(tester);
      // Assert
      await placarRobot.verificaCarregamentoDePlacar(tester);
    });
    testWidgets("failing test example", (WidgetTester tester) async {
      // Arrange

      // Act
      await regrasRobot.abraPaginaRegras(tester);
      await regrasRobot.escolhaJogar(tester);
      // Assert
      await escolhaRobot.verificaCarregamentoDeEscolha(tester);
    });
  });
}
