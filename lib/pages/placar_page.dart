import 'package:flutter/material.dart';

class PlacarPage extends StatefulWidget {
  const PlacarPage({Key? key}) : super(key: key);

  @override
  State<PlacarPage> createState() => _PlacarState();
}

class _PlacarState extends State<PlacarPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(child: Image.asset('assets/fundo.png')),
        Center(
            child: Container(
          color: Color.fromARGB(171, 255, 255, 255),
          width: 300.0,
          height: 300.0,
        )),
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
                            Navigator.pushNamed(context, '/escolha');
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
                                Color.fromARGB(255, 150, 35, 0)),
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
                            Navigator.pushNamed(context, '/regras');
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
                          Navigator.pushNamed(context, '/placar');
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
