import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jokenpo/app_widget.dart';

import '../robots/disputa_robot.dart';
import '../robots/escolha_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    group("Escolha integration test", () {
    late EscolhaRobot escolhaRobot;
    late DisputaRobot disputaRobot; 
    setUpAll(() {
      escolhaRobot = EscolhaRobot();
      disputaRobot = DisputaRobot();
    });

    testWidgets("when tap jOGAR", (WidgetTester tester) async {
      // Arrange

      // Act
      await escolhaRobot.abraPaginaEscolha(tester);
      await escolhaRobot.escolhaPedra(tester);
      await disputaRobot.clicarFight(tester);

      // Assert
      await disputaRobot.verificaMensagem(tester);
    });
  });

  
}
