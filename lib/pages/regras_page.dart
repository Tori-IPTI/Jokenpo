import 'package:flutter/material.dart';

class RegrasPage extends StatefulWidget {
  const RegrasPage({Key? key}) : super(key: key);

  @override
  State<RegrasPage> createState() => _RegrasPageState();
}

class _RegrasPageState extends State<RegrasPage> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 20,
      color: Color.fromARGB(255, 90, 5, 139),
    );
    return Scaffold(
      //para aparecer as possibilidades aperte ctrl espaço.

      body: Stack(
        children: <Widget>[
          Center(child: Image.asset('assets/fundo.png')),
          Center(
            child: Container(
                color: const Color.fromARGB(171, 255, 255, 255),
                width: 300.0,
                height: 300.0,
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Regras",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 90, 5, 139),
                      ),
                    ),
                    Text(
                      "A tesoura corta o papel, mas quebra com a pedra; o papel embrulha a pedra, mas é cortado pela tesoura e a pedra quebra a tesoura e é embrulhada pelo papel.",
                    ),
                  ],
                )),
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
                            // TODO: Colocar  Navigator.pushReplacementNamed(context, '/escolha'); aqui
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
      ),
    );
  }
}
