// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:asyncstate/asyncstate.dart';
import 'package:core/clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'package:atendimento/src/repositories/documents/documents_repository.dart';

class DocumentsScanConfirmController with MessageStateMixin {
  final pathRemoteStorage = signal<String?>(null);
  final DocumentsRepository repository;
  DocumentsScanConfirmController({
    required this.repository,
  });
  Future<void> uploadImage({
    required Uint8List imagBytes,
    required String fileName,
  }) async {
    final result = await repository
        .uploadImage(file: imagBytes, fileName: fileName)
        .asyncLoader();

    switch (result) {
      case Left():
        break;
      case Right(value: final String pathFile):
        pathRemoteStorage.value = pathFile;
        break;
    }
  }
}
