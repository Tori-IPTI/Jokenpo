import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/core/jogo.dart';
import 'package:jokenpo/core/rules/vencer.dart';
import 'package:jokenpo/core/status_jogo.dart';
import 'package:mocktail/mocktail.dart';

class MockJogo extends Mock implements Jogo {}

void main() {
  group("When rule Vencer was apply then return Status", () {
    final vencer = Vencer();
    final mockJogo = MockJogo();
    when(() => mockJogo.jogada1).thenReturn("*");

    test("When rule Vencer was apply then return Status ganhar", () {
      //Arrange - Arranjo
      when(() => mockJogo.jogada2).thenReturn("%");
      // Act - Ação
      final result = vencer.aplicar(mockJogo);
      //Assert - Afirmar
      expect(result, equals(StatusJogo.Vitoria));
    });
    test("When rule Vencer was apply then return Status perder", () {
      //Arrange - Arranjo
      when(() => mockJogo.jogada2).thenReturn("#");
      // Act - Ação
      final result = vencer.aplicar(mockJogo);
      //Assert - Afirmar
      expect(result, equals(StatusJogo.Derrota));
    });
    test("When rule Vencer was apply then return Status perder", () {
      //Arrange - Arranjo
      when(() => mockJogo.jogada2).thenReturn("*");
      // Act - Ação
      final result = vencer.aplicar(mockJogo);
      //Assert - Afirmar
      expect(result, equals(StatusJogo.none));
    });
  });
}

