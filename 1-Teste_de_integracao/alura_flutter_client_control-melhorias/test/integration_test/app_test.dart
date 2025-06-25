import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:client_control/main.dart' as app;

void main(){

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();// garante q o app vai rodar no simulador antes dos nossos testes

  testWidgets('Integration Test', (widgetTester) async{

    app.main();

    await widgetTester.pumpAndSettle(); //garantir que tudo foi inicializado

    expect(find.text('Menu'), findsNothing);
    await widgetTester.tap(find.byIcon(Icons.menu));
    await widgetTester.pumpAndSettle();
    expect(find.text('Menu'), findsOneWidget);
  },);

}