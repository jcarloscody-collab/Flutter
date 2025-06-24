import 'dart:typed_data';

import 'package:core/clinicas_core.dart';

abstract interface class DocumentsRepository {
  Future<Either<RepositoryException, String>> uploadImage({
    required Uint8List file,
    required String fileName,
  });
}
