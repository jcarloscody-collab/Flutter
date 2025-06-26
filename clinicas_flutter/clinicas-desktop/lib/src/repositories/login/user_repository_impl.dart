import 'dart:developer';
import 'dart:io';

import 'package:clinicas_adm_desktop/src/repositories/login/user_repository.dart';
import 'package:core/clinicas_core.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;

  UserRepositoryImpl({required this.restClient});

  @override
  Future<Either<AuthException, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final Response(data: {'access_token': accessToken}) =
          await restClient.unAuth.post(
        '/auth',
        data: {'email': email, 'password': password, 'admin': true},
      );

      return Right(value: accessToken);
    } catch (e, s) {
      log('Erro ao realizar o login', error: e, stackTrace: s);
      return switch (e) {
        DioException(response: Response(statusCode: HttpStatus.forbidden)?) =>
          Left(value: AuthUnauthorizedException()),
        _ => Left(value: AuthError(msg: 'Erro ao realizar login!'))
      };
    }
  }
}
