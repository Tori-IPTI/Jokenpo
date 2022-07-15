import 'dart:math';

import 'package:flutter/foundation.dart';

import 'player.dart';

class Severino extends Player {
  Severino() : super(nome: "Severino");

  @override
  String jogar() {
    final severino = Random();
    final jogadas = ["*", "#", "%"];
    final jogada = jogadas[severino.nextInt(3)];
    debugPrint("Severino invoca $jogada no campo de batalha");
    return jogada;
  }
}
//pobre severino foi desusado. 
