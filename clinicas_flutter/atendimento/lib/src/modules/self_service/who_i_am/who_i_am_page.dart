import 'package:atendimento/src/utils/routes.dart';
import 'package:core/clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validatorless/validatorless.dart';

import '../../../utils/strings.dart';
import '../self_service_controller.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});

  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> {
  final selfServiceController = Injector.get<SelfServiceController>();
  final formkey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final lastNameEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        nameEC.text = '';
        lastNameEC.text = '';
        selfServiceController.clearForm();
      },
      child: Scaffold(
        appBar: ClinicasAppBar(
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Finalizar Terminal'),
                ),
              ],
              onSelected: (value) async {
                if (value == 1) {
                  await SharedPreferences.getInstance().then(
                    (value) => value.clear(),
                  );
                  if (context.mounted) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      initial,
                      (route) => false,
                    );
                  }
                }
              },
            )
          ],
        ),
        body: LayoutBuilder(
          builder: (_, constrains) {
            return SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(minHeight: constrains.maxHeight),
                padding: EdgeInsets.all(40),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(backgroundLogin),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(40),
                    width: MediaQuery.sizeOf(context).width * .8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Image.asset(logoVertical),
                          const SizedBox(
                            height: 48,
                          ),
                          const Text(
                            'Bem-vindo!',
                            style: ClinicasTheme.titleStyle,
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                          TextFormField(
                            controller: nameEC,
                            validator:
                                Validatorless.required('Nome Obrigatório'),
                            decoration: const InputDecoration(
                              label: Text('Digite seu nome'),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            validator:
                                Validatorless.required('Last Obrigatório'),
                            controller: lastNameEC,
                            decoration: const InputDecoration(
                              label: Text('Digite seu sobrenome'),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .8,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                final valid =
                                    formkey.currentState?.validate() ?? false;

                                if (valid) {
                                  selfServiceController
                                      .setWhoIAmDataStepAndNext(
                                    name: nameEC.text,
                                    lastName: lastNameEC.text,
                                  );
                                }
                              },
                              child: Text('Continuar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
