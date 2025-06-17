import 'package:core/src/rest_client/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class RestClient extends DioForNative {
  RestClient({
    required String baseUrl,
  }) : super(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout:
                const Duration(seconds: 10), //espera 10s por uma conexão
            receiveTimeout:
                const Duration(seconds: 60), //tempo de resposta das aplicações
          ),
        ) {
    interceptors.addAll([
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
      AuthInterceptor(),
    ]);
  }

  RestClient get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClient get unAuth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
