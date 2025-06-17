import 'package:atendimento/src/modules/home/home_page.dart';
import 'package:atendimento/src/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => home;

  @override
  Map<String, WidgetBuilder> get pages => {
        initial: (context) => HomePage(),
      };
}
