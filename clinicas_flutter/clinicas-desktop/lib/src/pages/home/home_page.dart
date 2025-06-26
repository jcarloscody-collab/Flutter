import 'package:core/clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final deskNumberEC = TextEditingController();

  @override
  void dispose() {
    deskNumberEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(40),
            width: sizeOf.width * .4,
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
                Text(
                  'Bem Vindo!',
                  style: ClinicasTheme.titleStyle,
                ),
                SizedBox(
                  height: 32,
                ),
                const Text(
                  'Preencha',
                  style: ClinicasTheme.titleSmallStyle,
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: deskNumberEC,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required('Guichê obr'),
                      Validatorless.number('numerico'),
                    ],
                  ),
                  decoration: InputDecoration(
                    label: Text('número'),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Chamar próximo'),
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
