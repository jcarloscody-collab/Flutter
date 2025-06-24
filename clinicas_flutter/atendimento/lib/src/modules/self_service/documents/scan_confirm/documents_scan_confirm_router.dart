import 'package:atendimento/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_controller.dart';
import 'package:atendimento/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_page.dart';
import 'package:atendimento/src/repositories/documents/documents_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class DocumentsScanConfirmRouter extends FlutterGetItModulePageRouter {
  const DocumentsScanConfirmRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
          (i) => DocumentsScanConfirmController(repository: i()),
        ),
        Bind.lazySingleton(
          (i) => DocumentsRepositoryImpl(restClient: i()),
        ),
      ];

  @override
  WidgetBuilder get view => (_) => DocumentsScanConfirmPage();
}
