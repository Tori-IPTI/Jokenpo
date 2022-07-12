import 'dart:math';

import 'package:jokenpo/core/rules/empatar.dart';
import 'package:jokenpo/core/rules/vencer.dart';

import 'interacao_usuario.dart';
import 'jogador.dart';
import 'jogo.dart';

void main(List<String> args) {
  final jogador = createPlayer();
  final sevirino = createIA();

  final jogo = Jogo(regras: [Vencer(), Empatar()]);
  //desse jeito aqui estamos chamando o comportamento, ou seja a função.
  jogo.run(jogador, sevirino);
}

Jogador createPlayer() {
  return Jogador(
    nome: InteracaoUsuario.getPlayerName(),
    jogada: InteracaoUsuario.getPlayerMov,
  );
}

Jogador createIA() {
  return Jogador(
    nome: "Severino",
    jogada: () {
      final severino = Random();
      final jogadas = ["*", "#", "%"];
      final jogada = jogadas[severino.nextInt(3)];
      print("Severino invoca $jogada no campo de batalha");
      return jogada;
    },
  );
}
