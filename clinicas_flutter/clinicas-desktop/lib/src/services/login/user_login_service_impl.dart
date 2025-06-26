import 'package:clinicas_adm_desktop/src/repositories/login/user_repository.dart';
import 'package:clinicas_adm_desktop/src/services/login/user_login_service.dart';
import 'package:core/clinicas_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginServiceImpl implements UserLoginService {
  final UserRepository userRepository;

  UserLoginServiceImpl({required this.userRepository});

  @override
  Future<Either<ServiceException, Unit>> execute({
    required String email,
    required String password,
  }) async {
    final loginResult =
        await userRepository.login(email: email, password: password);
    switch (loginResult) {
      case Left(value: AuthError()):
        return Left(value: ServiceException(msg: 'Error ao realizar login'));
      case Left(value: AuthUnauthorizedException(:final msg)):
        return Left(value: ServiceException(msg: msg));
      case Right(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStorageConstants.accessToken, accessToken);
        return Right(value: unit);
    }
  }
}
