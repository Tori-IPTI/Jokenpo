import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/core/jogo.dart';
import 'package:jokenpo/core/rules/empatar.dart';
import 'package:jokenpo/core/status_jogo.dart';
import 'package:mocktail/mocktail.dart';

class MockJogo extends Mock implements Jogo {}

void main() {
  group("When rule Empatar was apply then return Status", () {
    final empatar = Empatar();
    final mockJogo = MockJogo();
    when(() => mockJogo.jogada1).thenReturn("*");

    test("When rule Empatar was apply then return Status empatado", () {
      // Arrange
      when(() => mockJogo.jogada2).thenReturn("*");
      //Act
      final result = empatar.aplicar(mockJogo);
      //Assert
      expect(result, equals(StatusJogo.empate));
    });
    test("When rule Empatar was apply then return Status none", () {
      // Arrange
      when(() => mockJogo.jogada2).thenReturn("#");
      //Act
      final result = empatar.aplicar(mockJogo);
      //Assert
      expect(result, equals(StatusJogo.none));
    });

    test("When rule Empatar was apply then return Status none", () {
      // Arrange
      when(() => mockJogo.jogada2).thenReturn("%");
      //Act
      final result = empatar.aplicar(mockJogo);
      //Assert
      expect(result, equals(StatusJogo.none));
    });
  });
}
