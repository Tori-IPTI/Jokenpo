import 'package:flutter/material.dart';
import 'package:jokenpo/core/jogo.dart';
import 'package:jokenpo/core/severino.dart';
import 'package:jokenpo/pages/diputa_page.dart';
import 'package:jokenpo/pages/escolha_page.dart';
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
    final jogo = Jogo(regras: [Vencer(), Empatar()]);

    return MultiProvider(
      providers: [
        Provider(
          create: (context) => jogo,
        ),
        Provider(
          create: (context) => Severino()
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        //showPerformanceOverlay: true,
        //debugShowCheckedModeBanner: true,
        //checkerboardOffscreenLayers: true,
        //debugShowMaterialGrid: true,
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
