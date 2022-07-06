import 'package:flutter/material.dart';
import 'package:jokenpo/pages/diputa_page.dart';
import 'package:jokenpo/pages/escolha_page.dart';
import 'package:jokenpo/pages/resultado_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255),
            brightness: Brightness.dark,
            primary: const Color.fromARGB(255, 99, 14, 8),
            secondary: const Color.fromARGB(255, 255, 255, 255)),
      ),
      initialRoute: '/escolha',
      routes: {
        '/': (context) => const MenuPage(),
        '/disputa': (context) => const DisputaPage(),
        '/escolha': (context) => const EscolhaPage(title: 'Jogo de Jokenpo'),
      },
    );
  }
}
