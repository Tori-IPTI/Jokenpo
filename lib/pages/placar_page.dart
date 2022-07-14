import 'package:flutter/material.dart';
import 'package:jokenpo/core/jogo.dart';
import 'package:provider/provider.dart';

class PlacarPage extends StatefulWidget {
  const PlacarPage({Key? key}) : super(key: key);

  @override
  State<PlacarPage> createState() => _PlacarState();
}

class _PlacarState extends State<PlacarPage> {
  @override
  Widget build(BuildContext context) {
    final jogo = context.watch<Jogo>();
    return Stack(
      children: <Widget>[
        Center(
          child: Consumer<Jogo>(
            builder: (context, jogo, children) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Placar",
                    key: const Key("TITLE_PAGE"),
                  ),
                ),
                body: Center(
                  child: Stack(
                    children: [
                      Container(
                        color: const Color.fromARGB(171, 255, 255, 255),
                        width: 300.0,
                        height: 300.0,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  'As nossas partidas jogadas: ${jogo.partidas}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: const Color.fromARGB(
                                          255, 47, 2, 73))),
                              Text(
                                'Suas vitórias: ${jogo.vitorias}',
                                style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        const Color.fromARGB(255, 47, 2, 73)),
                              ),
                              Text('Suas derrotas: ${jogo.derrotas}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: const Color.fromARGB(
                                          255, 47, 2, 73))),
                              Text('Seus empates: ${jogo.empates}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: const Color.fromARGB(
                                          255, 47, 2, 73))),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/escolha');
                          },
                          child: const Text(
                            "Jogar",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 150, 35, 0)),
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/regras');
                          },
                          child: const Text("Regras",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 255, 255, 255),
                              )),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 94, 5, 64)),
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/placar');
                        },
                        child: const Text("Placar",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                            )),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 10, 35, 145)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
