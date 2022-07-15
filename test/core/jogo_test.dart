import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/core/jogo.dart';
import 'package:jokenpo/core/rules/empatar.dart';
import 'package:jokenpo/core/rules/vencer.dart';
import 'package:jokenpo/core/status_jogo.dart';
import 'package:mocktail/mocktail.dart';

class MockEmpatar extends Mock implements Empatar {}

class MockVencer extends Mock implements Vencer {}

void main() {
  group("When Jogo exec iniciar with *", () {
    const jogada1 = '*';

    test(' and * return a Empate', () async {
      // Arrange
      final mockVencer = MockVencer();
      final mockEmpatar = MockEmpatar();

      final jogo = Jogo(regras: [mockVencer, mockEmpatar]);

      when(() => mockEmpatar.aplicar(jogo)).thenReturn(StatusJogo.empate);
      when(() => mockVencer.aplicar(jogo)).thenReturn(StatusJogo.none);

      const jogada2 = '*';

      // Act
      final jogada = jogo.iniciar(
        jogada1,
        jogada2,
      );

      // Assert
      expect(jogada, equals(StatusJogo.empate));
    });
    test(' and % return a Vitória', () async {
      // Arrange
      final mockVencer = MockVencer();
      final mockEmpatar = MockEmpatar();

      final jogo = Jogo(regras: [mockVencer, mockEmpatar]);

      when(() => mockEmpatar.aplicar(jogo)).thenReturn(StatusJogo.none);
      when(() => mockVencer.aplicar(jogo)).thenReturn(StatusJogo.vitoria);

      const jogada2 = '%';

      // Act
      final jogada = jogo.iniciar(
        jogada1,
        jogada2,
      );

      // Assert
      expect(jogada, equals(StatusJogo.vitoria));
    });
    test(' and # return a Derrota', () async {
      // Arrange
      final mockVencer = MockVencer();
      final mockEmpatar = MockEmpatar();

      final jogo = Jogo(regras: [mockVencer, mockEmpatar]);

      when(() => mockEmpatar.aplicar(jogo)).thenReturn(StatusJogo.none);
      when(() => mockVencer.aplicar(jogo)).thenReturn(StatusJogo.derrota);

      const jogada2 = '#';

      // Act
      final jogada = jogo.iniciar(
        jogada1,
        jogada2,
      );

      // Assert
      expect(jogada, equals(StatusJogo.derrota));
    });
  });

  group("When Jogo exec iniciar with #", () {
    const jogada1 = '#';

    test(' and # return a Empate', () async {
      // Arrange
      final mockVencer = MockVencer();
      final mockEmpatar = MockEmpatar();

      final jogo = Jogo(regras: [mockVencer, mockEmpatar]);

      when(() => mockEmpatar.aplicar(jogo)).thenReturn(StatusJogo.empate);
      when(() => mockVencer.aplicar(jogo)).thenReturn(StatusJogo.none);

      const jogada2 = '#';

      // Act
      final jogada = jogo.iniciar(
        jogada1,
        jogada2,
      );

      // Assert
      expect(jogada, equals(StatusJogo.empate));
    });
    test(' and * return a Vitória', () async {
      // Arrange
      final mockVencer = MockVencer();
      final mockEmpatar = MockEmpatar();

      final jogo = Jogo(regras: [mockVencer, mockEmpatar]);

      when(() => mockEmpatar.aplicar(jogo)).thenReturn(StatusJogo.none);
      when(() => mockVencer.aplicar(jogo)).thenReturn(StatusJogo.vitoria);

      const jogada2 = '*';

      // Act
      final jogada = jogo.iniciar(
        jogada1,
        jogada2,
      );

      // Assert
      expect(jogada, equals(StatusJogo.vitoria));
    });
    test(' and % return a Derrota', () async {
      // Arrange
      final mockVencer = MockVencer();
      final mockEmpatar = MockEmpatar();

      final jogo = Jogo(regras: [mockVencer, mockEmpatar]);

      when(() => mockEmpatar.aplicar(jogo)).thenReturn(StatusJogo.none);
      when(() => mockVencer.aplicar(jogo)).thenReturn(StatusJogo.derrota);

      const jogada2 = '%';

      // Act
      final jogada = jogo.iniciar(
        jogada1,
        jogada2,
      );

      // Assert
      expect(jogada, equals(StatusJogo.derrota));
    });
  });

  group("When Jogo exec iniciar with %", () {
    const jogada1 = '%';

    test(' and % return a Empate', () async {
      // Arrange
      final mockVencer = MockVencer();
      final mockEmpatar = MockEmpatar();

      final jogo = Jogo(regras: [mockVencer, mockEmpatar]);

      when(() => mockEmpatar.aplicar(jogo)).thenReturn(StatusJogo.empate);
      when(() => mockVencer.aplicar(jogo)).thenReturn(StatusJogo.none);

      const jogada2 = '%';

      // Act
      final jogada = jogo.iniciar(
        jogada1,
        jogada2,
      );

      // Assert
      expect(jogada, equals(StatusJogo.empate));
    });
    test(' and # return a Vitória', () async {
      // Arrange
      final mockVencer = MockVencer();
      final mockEmpatar = MockEmpatar();

      final jogo = Jogo(regras: [mockVencer, mockEmpatar]);

      when(() => mockEmpatar.aplicar(jogo)).thenReturn(StatusJogo.none);
      when(() => mockVencer.aplicar(jogo)).thenReturn(StatusJogo.vitoria);

      const jogada2 = '#';

      // Act
      final jogada = jogo.iniciar(
        jogada1,
        jogada2,
      );

      // Assert
      expect(jogada, equals(StatusJogo.vitoria));
    });
    test(' and * return a Derrota', () async {
      // Arrange
      final mockVencer = MockVencer();
      final mockEmpatar = MockEmpatar();

      final jogo = Jogo(regras: [mockVencer, mockEmpatar]);

      when(() => mockEmpatar.aplicar(jogo)).thenReturn(StatusJogo.none);
      when(() => mockVencer.aplicar(jogo)).thenReturn(StatusJogo.derrota);

      const jogada2 = '*';

      // Act
      final jogada = jogo.iniciar(
        jogada1,
        jogada2,
      );

      // Assert
      expect(jogada, equals(StatusJogo.derrota));
    });
  });
}
