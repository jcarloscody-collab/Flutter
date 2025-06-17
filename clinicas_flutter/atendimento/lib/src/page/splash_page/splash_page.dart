import 'package:atendimento/src/modules/auth/auth_module.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        Duration(seconds: 2),
        () {
          if (mounted) {
            Navigator.of(context)
                .pushReplacementNamed(AuthModule.loginRouter());
          }
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('./assets/images/logo_vertical.png'),
      ),
    );
  }
}
