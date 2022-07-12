import 'package:flutter/material.dart';
import 'package:jokenpo/core/jogo.dart';
import 'package:jokenpo/pages/diputa_page.dart';
import 'package:jokenpo/pages/escolha_page.dart';
//import 'package:jokenpo/pages/resultado_page.dart';
import 'package:jokenpo/pages/menu_page.dart';
import 'package:jokenpo/pages/placar_page.dart';
import 'package:jokenpo/pages/regras_page.dart';
import 'package:provider/provider.dart';

import 'core/rules/empatar.dart';
import 'core/rules/vencer.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Jogo(regras: [Vencer(), Empatar()]),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255),
            brightness: Brightness.dark,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MenuPage(),
          '/placar': (context) => const PlacarPage(),
          '/regras': (context) => const RegrasPage(),
          '/disputa': (context) => const DisputaPage(),
          '/escolha': (context) => const EscolhaPage(title: 'Jogo de Jokenpo'),
        },
      ),
    );
  }
}
