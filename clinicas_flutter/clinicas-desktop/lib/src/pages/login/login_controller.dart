import 'package:clinicas_adm_desktop/src/services/login/user_login_service.dart';
import 'package:core/clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginController with MessageStateMixin {
  LoginController({required UserLoginService userLogin})
      : _loginService = userLogin;

  final UserLoginService _loginService;

  final _obscurePassword = signal(true);
  final _logged = signal(false);

  bool get obscurePassword => _obscurePassword();
  bool get logged => _logged();

  void passwordToggle() => _obscurePassword.value = !_obscurePassword.value;

  Future<void> login(String email, String password) async {
    _logged.value = true; //para teste

    final loginResult =
        await _loginService.execute(email: email, password: password);

    switch (loginResult) {
      case Left(value: ServiceException(:final msg)):
        showError(message: msg);
        break;
      case Right(value: _):
        _logged.value = true;
    }
  }
}
