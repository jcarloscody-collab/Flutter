import 'dart:io';

import 'package:atendimento/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_controller.dart';
import 'package:atendimento/src/utils/routes.dart';
import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:core/clinicas_core.dart';
import 'package:flutter_getit/flutter_getit.dart';

class DocumentsScanConfirmPage extends StatelessWidget {
  DocumentsScanConfirmPage({super.key});

  final controller = Injector.get<DocumentsScanConfirmController>();

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    final foto = ModalRoute.of(context)!.settings.arguments as XFile;
    return Scaffold(
      appBar: ClinicasAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * .85,
            margin: const EdgeInsets.only(top: 18),
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ClinicasTheme.orangeColor),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/foto_confirm_icon.png'),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Confira a sua foto',
                  style: ClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: DottedBorder(
                    dashPattern: const [1, 10, 1, 3],
                    borderType: BorderType.RRect,
                    strokeWidth: 4,
                    strokeCap: StrokeCap.square,
                    radius: const Radius.circular(16),
                    color: ClinicasTheme.orangeColor,
                    child: SizedBox(
                      width: sizeOf.width * .5,
                      child: Image.file(
                        File(foto.path),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Tirar Outra'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('$selfService$documentsScanConfirm');
                          },
                          child: const Text('Salvar'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
