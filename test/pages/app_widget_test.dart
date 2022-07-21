import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokenpo/app_widget.dart';
import 'package:mockingjay/mockingjay.dart';

void main() {
  testWidgets('Jogar button was taped then navigate to EscolhaPage',
      (WidgetTester tester) async {
    final navigatorMock = MockNavigator();
    when(() => navigatorMock.pushReplacementNamed(any())).thenAnswer((_) async {
      return null;
    });

    final page = MaterialApp(
      home: MockNavigatorProvider(
        navigator: navigatorMock,
        child: const AppWidget(),
      ),
    );
  });
}
