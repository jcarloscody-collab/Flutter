import 'package:clinicas_adm_desktop/src/utils/assets.dart';
import 'package:clinicas_adm_desktop/src/utils/routes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Navigator.of(context).pushReplacementNamed(routeLogin);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(logoVertical),
      ),
    );
  }
}
