sealed class AuthException implements Exception {
  final String msg;

  AuthException({required this.msg});
}

class AuthError extends AuthException {
  AuthError({required super.msg});
}

class AuthUnauthorizedException extends AuthException {
  AuthUnauthorizedException() : super(msg: 'Você não está autorizado!');
}
