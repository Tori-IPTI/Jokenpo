import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/core/severino.dart';

void main() {
  test('When Severino exec jogar return a valid symbol', () async {
    // Arrange
    final severino = Severino();
    // Act
    final jogada = severino.jogar();
    // Assert
    expect(jogada, isIn(['*', '%', '#']));
  });
}
