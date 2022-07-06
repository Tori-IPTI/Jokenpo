import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jokenpo/core/jogo.dart';
import 'package:jokenpo/core/status_jogo.dart';

class DisputaArguments {
  final String assetPlayer;
  final String symbolPlayer;

  DisputaArguments({required this.assetPlayer, required this.symbolPlayer});
}

class DisputaPage extends StatefulWidget {
  const DisputaPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DisputaPage> createState() => _DisputaPageState();
}

class _DisputaPageState extends State<DisputaPage> {
  late String assetSeverino;
  late String symbolSeverino;

  final options = <String, String>{
    "*": "assets/pedra.png",
    "#": "assets/papel.png",
    "%": "assets/tesoura.png",
  };

  final messages = <StatusJogo, String>{
    StatusJogo.Vitoria: "Você venceu!",
    StatusJogo.Empate: "Ops! empatou",
    StatusJogo.Derrota: "Vocẽ perdeu, mané",
  };

  final jogo = Jogo();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final severino = Random();
    final jogadas = ["*", "#", "%"];
    final jogada = jogadas[severino.nextInt(3)];

    setState(() {
      symbolSeverino = jogada;
      assetSeverino = options[jogada]!;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DisputaArguments;
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
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    args.assetPlayer,
                    width: 150,
                    height: 120,
                  ),
                  /*
                  child: Transform(
                    transform: Matrix4.rotationY(pi),
                    origin: const Offset(150 / 2, 0),
                    child: Image.asset(
                      widget.assetPlayer,
                      width: 150,
                      height: 120,
                    ),
                  ),*/
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
            ElevatedButton(
                onPressed: () {
                  final result = jogo.iniciar(
                    args.symbolPlayer,
                    symbolSeverino,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(messages[result]!),
                    ),
                  );

                  Navigator.pop(context);
                },
                child: const Text("Fight!"))
          ],
        ),
      ),
    );
  }
}
