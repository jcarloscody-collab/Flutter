import 'package:atendimento/src/modules/self_service/patient/patient_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'patient_controller.dart';

class PatientRouter extends FlutterGetItModulePageRouter {
  @override
  WidgetBuilder get view => (_) => const PatientPage();

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
          (i) => PatientController(repository: i()),
        )
      ];
}
