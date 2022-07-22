// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jokenpo/core/severino.dart';
import 'package:provider/provider.dart';
import 'package:jokenpo/core/jogo.dart';
import 'package:jokenpo/core/status_jogo.dart';

class DisputaArguments {
  final String assetPlayer;
  final String symbolPlayer;

  DisputaArguments({required this.assetPlayer, required this.symbolPlayer});

  @override
  bool operator ==(covariant DisputaArguments other) {
    if (identical(this, other)) return true;

    return other.assetPlayer == assetPlayer &&
        other.symbolPlayer == symbolPlayer;
  }

  @override
  int get hashCode => assetPlayer.hashCode ^ symbolPlayer.hashCode;
}

class DisputaPage extends StatefulWidget {
  const DisputaPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DisputaPage> createState() => _DisputaPageState();
}

class _DisputaPageState extends State<DisputaPage> {
  late DisputaArguments? args;
  late String assetSeverino;
  late String symbolSeverino;

  final options = <String, String>{
    "*": "assets/pedra.png",
    "#": "assets/papel.png",
    "%": "assets/tesoura.png",
  };

  final messages = <StatusJogo, String>{
    StatusJogo.vitoria: "Você venceu!",
    StatusJogo.empate: "Ops! empatou",
    StatusJogo.derrota: "Você perdeu, mané",
  };

  late Jogo jogo;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    jogo = context.watch<Jogo>();
    args = ModalRoute.of(context)?.settings.arguments as DisputaArguments?;
    final severino = context.watch<Severino>();

    final jogada = severino.jogar();

    setState(() {
      symbolSeverino = jogada;
      assetSeverino = options[jogada]!;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Disputa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Fight",
              key: Key("TITLE_PAGE"),
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            if (args is! DisputaArguments)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (args is DisputaArguments)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      args!.assetPlayer,
                      width: 150,
                      height: 120,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform(
                      transform: Matrix4.rotationY(pi),
                      origin: const Offset(150 / 2, 0),
                      child: Image.asset(
                        assetSeverino,
                        fit: BoxFit.fitWidth,
                        width: 150,
                        height: 120,
                      ),
                    ),
                  ),
                ],
              ),
            if (args is DisputaArguments)
              ElevatedButton(
                  key: const Key("iniciar"),
                  onPressed: () {
                    final result = jogo.iniciar(
                      args!.symbolPlayer,
                      symbolSeverino,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(messages[result]!),
                      ),
                    );
                    Navigator.pushReplacementNamed(context, '/escolha');
                  },
                  child: const Text("Voltar"))
          ],
        ),
      ),
    );
  }
}
