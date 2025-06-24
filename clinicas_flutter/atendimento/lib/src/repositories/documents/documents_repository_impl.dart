import 'dart:developer';
import 'dart:typed_data';

import 'package:core/clinicas_core.dart';
import 'package:dio/dio.dart';

import './documents_repository.dart';

class DocumentsRepositoryImpl implements DocumentsRepository {
  final RestClient restClient;

  DocumentsRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryException, String>> uploadImage(
      {required Uint8List file, required String fileName}) async {
    try {
      final formData = FormData.fromMap(
        {
          'file': MultipartFile.fromBytes(
            file,
            filename: fileName,
          ),
        },
      );

      final Response(data: {'url': pathImage}) =
          await restClient.auth.post('/uploads', data: formData);
      return Right(value: pathImage);
    } on DioException catch (e, s) {
      log('Erro ao fazer upload', error: e, stackTrace: s);
      return Left(value: RepositoryException());
    }
  }
}
