import 'package:flutter/material.dart';
import 'package:jokenpo/pages/diputa_page.dart';
import '../core/jogo.dart';

class EscolhaPage extends StatefulWidget {
  const EscolhaPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EscolhaPage> createState() => _EscolhaPageState();
}

class _EscolhaPageState extends State<EscolhaPage> {
  late Jogo jogo;

  double imageSize = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Flexible(
              child: Text(
                "Jokenpo",
                key: Key("TITLE_PAGE"),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: const JokenpoOption(
                  key: Key("OPTION_PEDRA"),
                  asset: 'assets/pedra.png',
                  symbol: "*",
                ),
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: const JokenpoOption(
                  key: Key("OPTION_PAPEL"),
                  asset: 'assets/papel.png',
                  symbol: "#",
                ),
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: const JokenpoOption(
                  key: Key("OPTION_TESOURA"),
                  asset: 'assets/tesoura.png',
                  symbol: "%",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JokenpoOption extends StatelessWidget {
  const JokenpoOption({
    Key? key,
    required this.asset,
    required this.symbol,
  }) : super(key: key);

  final String asset;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              settings: RouteSettings(
                name: "/disputa",
                arguments:
                    DisputaArguments(assetPlayer: asset, symbolPlayer: symbol),
              ),
              builder: (context) {
                return const DisputaPage();
              },
            ));
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image.asset(
          asset,
          width: 225,
          height: 120,
        ),
      ),
      /*
      child: Align(
        alignment: Alignment.centerLeft,
        child: Transform(
          transform: Matrix4.rotationY(pi),
          origin: const Offset(180 / 2, 0),
          child: Image.asset(
            asset,
            width: 225,
            height: 120,
          ),
        ),
      ),
      */
    );
  }
}
