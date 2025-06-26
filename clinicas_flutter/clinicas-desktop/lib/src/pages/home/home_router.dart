import 'package:clinicas_adm_desktop/src/pages/home/home_page.dart';
import 'package:clinicas_adm_desktop/src/pages/login/login_controller.dart';
import 'package:clinicas_adm_desktop/src/repositories/login/user_repository.dart';
import 'package:clinicas_adm_desktop/src/repositories/login/user_repository_impl.dart';
import 'package:clinicas_adm_desktop/src/services/login/user_login_service.dart';
import 'package:clinicas_adm_desktop/src/services/login/user_login_service_impl.dart';
import 'package:clinicas_adm_desktop/src/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeRouter extends FlutterGetItPageRouter {
  const HomeRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>(
          (i) => UserRepositoryImpl(
            restClient: i(),
          ),
        ),
        Bind.lazySingleton<UserLoginService>(
          (i) => UserLoginServiceImpl(userRepository: i()),
        ),
        Bind.lazySingleton(
          (i) => LoginController(userLogin: i()),
        )
      ];

  @override
  WidgetBuilder get view => (context) => const HomePage();

  @override
  String get routeName => routeHome;
}
