import 'package:core/clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../self_service_controller.dart';

class ClinicasSelfServiceAppBar extends ClinicasAppBar {
  ClinicasSelfServiceAppBar({super.key})
      : super(
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Reiniciar Processo'),
                ),
              ],
              onSelected: (value) async {
                Injector.get<SelfServiceController>().restartProcess();
              },
            )
          ],
        );
}
