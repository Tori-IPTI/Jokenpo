
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../robots/escolha_robot.dart';
import '../robots/placar_robot.dart';
import '../robots/regras_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Placar integration test", () {
    late PlacarRobot placarRobot;
    late EscolhaRobot escolhaRobot;
    late RegrasRobot regrasRobot;

    setUpAll(() {
      placarRobot = PlacarRobot();
      escolhaRobot = EscolhaRobot();
      regrasRobot = RegrasRobot();
    });

    testWidgets("when tap jOGAR", (WidgetTester tester) async {
      // Arrange

      // Act
      await placarRobot.abraPaginaPlacar(tester);
      await placarRobot.escolhaJogar(tester);
      // Assert
      await escolhaRobot.verificaCarregamentoDeEscolha(tester);
    });
    testWidgets("when tap REGRAS", (WidgetTester tester) async {
    // Arrange

      // Act
      await placarRobot.abraPaginaPlacar(tester);
      await placarRobot.escolhaRegras(tester);
      // Assert
      await regrasRobot.verificaCarregamentoDeRegras(tester);
  });
  });
}
