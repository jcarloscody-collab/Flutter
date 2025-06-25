import 'package:clinicas_adm_desktop/src/core/env.dart';
import 'package:core/clinicas_core.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton(
          (i) => RestClient(baseUrl: Env.backendBaseUrl),
        ),
      ];
}
