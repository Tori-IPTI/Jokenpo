import '../jogo.dart';
import 'regra.dart';
import '../status_jogo.dart';

class Empatar extends Regra {
  @override
  StatusJogo aplicar(Jogo jogo) {
    if (jogo.jogada1 == jogo.jogada2) {
      return StatusJogo.empate;
    }

    return StatusJogo.none;
  }
}
