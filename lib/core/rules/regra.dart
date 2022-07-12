import '../jogo.dart';
import '../status_jogo.dart';

abstract class Regra {
  StatusJogo aplicar(Jogo jogo);
}
