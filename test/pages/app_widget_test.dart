import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/app_widget.dart';
import 'package:jokenpo/pages/escolha_page.dart';
import 'package:jokenpo/pages/menu_page.dart';
import 'package:jokenpo/pages/placar_page.dart';
import 'package:jokenpo/pages/regras_page.dart';
import 'package:mockingjay/mockingjay.dart';

void main() {
  testWidgets('Jogar button was taped then navigate to RegrasPage',
      (WidgetTester tester) async {
    final navigatorMock = MockNavigator();
    when(() => navigatorMock.pushReplacementNamed(any())).thenAnswer((_) async {
      return null;
    });
    const page = AppWidget(
      rotaInicial: "/regras",
    );
    await tester.pumpWidget(page);
    expect(find.byType(RegrasPage), findsOneWidget);
  });

  testWidgets('When AppWidget is build then navigate to PlacarPage',
      (WidgetTester tester) async {
    final navigatorMock = MockNavigator();
    when(() => navigatorMock.pushReplacementNamed(any())).thenAnswer((_) async {
      return null;
    });
    const page = AppWidget(
      rotaInicial: "/placar",
    );
    await tester.pumpWidget(page);
    expect(find.byType(PlacarPage), findsOneWidget);
  });

   testWidgets('When AppWidget is build then navigate to EscolhaPage',
      (WidgetTester tester) async {
    final navigatorMock = MockNavigator();
    when(() => navigatorMock.pushReplacementNamed(any())).thenAnswer((_) async {
      return null;
    });
    const page = AppWidget(
      rotaInicial: "/escolha",
    );
    await tester.pumpWidget(page);
    expect(find.byType(EscolhaPage), findsOneWidget);
  });
}
