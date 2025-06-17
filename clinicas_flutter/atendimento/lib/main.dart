import 'dart:async';
import 'dart:developer';

import 'package:atendimento/src/binding/clinicas_application_binding.dart';
import 'package:atendimento/src/modules/auth/auth_module.dart';
import 'package:atendimento/src/modules/home/home_module.dart';
import 'package:atendimento/src/modules/self_service/self_service_module.dart';
import 'package:atendimento/src/page/splash_page/splash_page.dart';
import 'package:atendimento/src/utils/routes.dart';
import 'package:camera/camera.dart';
import 'package:core/clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

late List<CameraDescription> _cameras;

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      _cameras = await availableCameras();
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
      bindings: ClinicasApplicationBinding(),
      modules: [
        AuthModule(),
        HomeModule(),
        SelfServiceModule(),
      ],
      pagesBuilders: [
        FlutterGetItPageBuilder(
          page: (context) => const SplashPage(),
          path: initial,
        ),
      ],
      didStart: () {
        FlutterGetItBindingRegister.registerPermanentBinding(
          'CAMERAS',
          [
            Bind.lazySingleton(
              (i) => _cameras,
            ),
          ],
        );
      },
    );
  }
}
