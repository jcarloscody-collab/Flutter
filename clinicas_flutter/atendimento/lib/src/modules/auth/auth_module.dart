import 'package:atendimento/src/modules/auth/login/login_router.dart';
import 'package:atendimento/src/repositories/user/user_repository.dart';
import 'package:atendimento/src/repositories/user/user_repository_impl.dart';
import 'package:atendimento/src/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class AuthModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => auth;

  static String loginRouter() => '$auth$login';

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>(
          (i) => UserRepositoryImpl(
            restClient: i(),
          ),
        ),
      ];

  @override
  Map<String, WidgetBuilder> get pages => {
        login: (context) => const LoginRouter(),
      };
}
