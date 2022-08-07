
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../robots/menu_robot.dart';
import '../robots/escolha_robot.dart';
import '../robots/regras_robot.dart';
import '../robots/placar_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("Menu integration test", () {
    late MenuRobot menuRobot;
    late EscolhaRobot escolhaRobot;
    late RegrasRobot regrasRobot;
    late PlacarRobot placarRobot;

    setUpAll(() {
      menuRobot = MenuRobot();
      escolhaRobot = EscolhaRobot();
      regrasRobot = RegrasRobot();
      placarRobot = PlacarRobot();
    });

    testWidgets("when tap jOGAR", (WidgetTester tester) async {
      // Arrange

      // Act
      await menuRobot.abraPaginaMenu(tester);
      await menuRobot.escolhaJogar(tester);

      // Assert
      await escolhaRobot.verificaCarregamentoDeEscolha(tester);
    });
    testWidgets("when tap REGRAS", (WidgetTester tester) async {
      // Arrange
      // Act
      await menuRobot.abraPaginaMenu(tester);
      await menuRobot.escolhaRegras(tester);

      // Assert
      await regrasRobot.verificaCarregamentoDeRegras(tester);
    });
    testWidgets("when tap PLACAR", (WidgetTester tester) async {
      // Arrange
      // Act
      await menuRobot.abraPaginaMenu(tester);
      await menuRobot.escolhaPlacar(tester);

      // Assert
      await placarRobot.verificaCarregamentoDePlacar(tester);
    });
  });
}
