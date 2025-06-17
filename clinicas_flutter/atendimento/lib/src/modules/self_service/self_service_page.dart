import 'package:atendimento/src/modules/self_service/self_service_controller.dart';
import 'package:atendimento/src/utils/routes.dart';
import 'package:core/clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SelfServicePage extends StatefulWidget {
  const SelfServicePage({super.key});

  @override
  State<SelfServicePage> createState() => _SelfServicePageState();
}

class _SelfServicePageState extends State<SelfServicePage>
    with MessageViewMixin {
  final controller = Injector.get<SelfServiceController>();

  @override
  void initState() {
    messageListenerMessages(stateMixin: controller);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        controller.startProcess();

        effect(
          () {
            final step = controller.step;

            switch (step) {
              case FormSteps.none:
                return;
              case FormSteps.whoIAm:
                Navigator.of(context).pushNamed('$selfService$whoIAm');
              case FormSteps.findPatient:
                Navigator.of(context).pushNamed('$selfService$findPatient');
              case FormSteps.patient:
                Navigator.of(context).pushNamed('$selfService$patient');
              case FormSteps.documents:
                Navigator.of(context).pushNamed('$selfService$documents');
              case FormSteps.done:
                Navigator.of(context).pushNamed('$selfService$done');
              case FormSteps.restart:
                Navigator.of(context)
                    .popUntil(ModalRoute.withName(selfService));
                controller.startProcess();

                return;
            }
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
