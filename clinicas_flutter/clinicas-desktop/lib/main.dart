import 'dart:async';
import 'dart:developer';

import 'package:clinicas_adm_desktop/src/bindings/lab_clinicas_application_binding.dart';
import 'package:clinicas_adm_desktop/src/pages/login/login_router.dart';
import 'package:clinicas_adm_desktop/src/pages/splash/splash_page.dart';
import 'package:clinicas_adm_desktop/src/utils/routes.dart';
import 'package:core/clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(const ClinicasAutoAtendimento());
    },
    (error, stack) {
      log(
        'Erro não tratado',
        error: error,
        stackTrace: stack,
      );
    },
  );
}

class ClinicasAutoAtendimento extends StatelessWidget {
  const ClinicasAutoAtendimento({super.key});

  @override
  Widget build(BuildContext context) {
    return ClinicasCoreConfig(
      title: 'Clinicas Auto Atendimento',
      bindings: LabClinicasApplicationBinding(),
      modules: [],
      page: [
        LoginRouter(),
      ],
      pagesBuilders: [
        FlutterGetItPageBuilder(
          page: (context) => const SplashPage(),
          path: initial,
        ),
      ],
      didStart: () {},
    );
  }
}
