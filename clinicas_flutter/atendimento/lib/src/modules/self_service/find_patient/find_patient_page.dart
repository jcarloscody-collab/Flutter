import 'package:atendimento/src/modules/self_service/self_service_controller.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:core/clinicas_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

import '../../../utils/strings.dart';
import '../widget/clinicas_self_service_app_bar.dart';
import 'find_patient_controller.dart';

class FindPatientPage extends StatefulWidget {
  const FindPatientPage({super.key});

  @override
  State<FindPatientPage> createState() => _FindPatientPageState();
}

class _FindPatientPageState extends State<FindPatientPage>
    with MessageViewMixin {
  final controller = Injector.get<FindPatientController>();

  final formkey = GlobalKey<FormState>();

  final cpfEC = TextEditingController();

  @override
  void initState() {
    messageListenerMessages(stateMixin: controller);
    effect(
      () {
        final FindPatientController(:patient, :patientNotFound) = controller;
        if (patient != null || patientNotFound != null) {
          Injector.get<SelfServiceController>()
              .goToFormPatient(patient: patient);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClinicasSelfServiceAppBar(),
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
                        TextFormField(
                          controller: cpfEC,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter(),
                          ],
                          validator: Validatorless.required('Digite o CPF'),
                          decoration: const InputDecoration(
                            label: Text('Digite seu cpf'),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Text(
                              'Não sabe o CPF do paciente',
                              style: TextStyle(
                                fontSize: 14,
                                color: ClinicasTheme.blueColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.continueWithoutDocument();
                              },
                              child: Text(
                                'Clique Aqui',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ClinicasTheme.orangeColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * .8,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () async {
                              final valid =
                                  formkey.currentState?.validate() ?? false;

                              if (valid) {
                                await controller.findPatientByDocument(
                                    document: cpfEC.text);
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
    );
  }
}
