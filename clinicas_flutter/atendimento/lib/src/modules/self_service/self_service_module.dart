import 'package:atendimento/src/modules/self_service/documents/documents_page.dart';
import 'package:atendimento/src/modules/self_service/documents/scan/scan_page.dart';
import 'package:atendimento/src/modules/self_service/documents/scan_confirm/scan_confirm_page.dart';
import 'package:atendimento/src/modules/self_service/done/done_page.dart';
import 'package:atendimento/src/modules/self_service/find_patient/find_patient_router.dart';
import 'package:atendimento/src/modules/self_service/self_service_controller.dart';
import 'package:atendimento/src/modules/self_service/self_service_page.dart';
import 'package:atendimento/src/modules/self_service/who_i_am/who_i_am_page.dart';
import 'package:atendimento/src/repositories/patients/patient_repository.dart';
import 'package:atendimento/src/repositories/patients/patient_repository_impl.dart';
import 'package:atendimento/src/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'patient/patient_router.dart';

class SelfServiceModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => SelfServiceController()),
        Bind.lazySingleton<PatientRepository>(
            (i) => PatientRepositoryImpl(restClient: i())),
      ];

  @override
  String get moduleRouteName => selfService;

  @override
  Map<String, WidgetBuilder> get pages => {
        initial: (context) => SelfServicePage(),
        whoIAm: (ctx) => WhoIAmPage(),
        findPatient: (ctx) => FindPatientRouter(),
        patient: (ctx) => PatientRouter(),
        documents: (ctx) => DocumentsPage(),
        documentsScan: (ctx) => ScanPage(),
        documentsScanConfirm: (ctx) => ScanConfirmPage(),
        done: (ctx) => DonePage(),
      };
}
