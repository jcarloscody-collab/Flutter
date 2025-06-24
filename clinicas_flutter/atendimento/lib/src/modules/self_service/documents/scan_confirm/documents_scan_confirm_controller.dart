import 'dart:typed_data';

import 'package:core/clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class DocumentsScanConfirmController with MessageStateMixin {
  final pathRemoteStorage = signal<String?>(null);

  Future<void> uploadImage({
    required Uint8List imagBytes,
    required String fileName,
  }) async {}
}
