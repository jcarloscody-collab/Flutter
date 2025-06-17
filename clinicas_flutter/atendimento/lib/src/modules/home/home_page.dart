import 'package:atendimento/src/utils/routes.dart';
import 'package:core/clinicas_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: ClinicasAppBar(
        actions: [
          PopupMenuButton(
            child: IconPopupMenuWidget(),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text('Iniciar Terminal'),
              ),
              PopupMenuItem(
                value: 2,
                child: const Text('Finalizar Terminal'),
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(selfService),
              ),
            ],
          )
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
            margin: EdgeInsets.only(top: 112),
            width: sizeOf.width * .8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: ClinicasTheme.orangeColor,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Bem Vindo!',
                  style: ClinicasTheme.titleStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: sizeOf.width * .8,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(selfService);
                    },
                    child: const Text('INICIAR TERMINAL'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
