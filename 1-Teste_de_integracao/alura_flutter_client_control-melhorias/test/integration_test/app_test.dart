import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:client_control/main.dart' as app;

void main(){

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();// garante q o app vai rodar no simulador antes dos nossos testes

  testWidgets('Integration Test', (widgetTester) async{

    app.main();

    await widgetTester.pumpAndSettle(); //garantir que tudo foi inicializado

    expect(find.text('Clientes'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    await widgetTester.tap(find.byIcon(Icons.menu));
    await widgetTester.pumpAndSettle();

    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Gerenciar clientes'), findsOneWidget);
    expect(find.text('Tipos de clientes'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);

    await widgetTester.tap(find.text('Tipos de clientes'));
    await widgetTester.pumpAndSettle();

    expect(find.text('Tipos de clientes'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.text('Platinum'), findsOneWidget);
    expect(find.text('Golden'), findsOneWidget);
    expect(find.text('Titanium'), findsOneWidget);
    expect(find.text('Diamond'), findsOneWidget);

    await widgetTester.tap(find.byType(FloatingActionButton));
    await widgetTester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    await widgetTester.enterText(find.byType(TextFormField), 'Ferro');

    await widgetTester.tap(find.text('Selecionar icone'));
    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.byIcon(Icons.card_giftcard));
    await widgetTester.pumpAndSettle();

    await widgetTester.tap(find.text('Salvar'));
    await widgetTester.pumpAndSettle();
    expect(find.text('Ferro'), findsOneWidget);
    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);

  },);

}