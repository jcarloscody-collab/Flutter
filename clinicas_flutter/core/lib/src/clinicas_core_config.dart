import 'package:asyncstate/asyncstate.dart';
import 'package:core/src/loader/clinicas_loader.dart';
import 'package:core/src/theme/clinicas_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class ClinicasCoreConfig extends StatelessWidget {
  const ClinicasCoreConfig({
    super.key,
    this.bindings,
    this.page,
    this.pagesBuilders,
    this.modules,
    this.didStart,
    required this.title,
  });

  final ApplicationBindings? bindings; //dependências
  final List<FlutterGetItPageRouter>? page;
  final List<FlutterGetItPageBuilder>? pagesBuilders;
  final List<FlutterGetItModule>? modules;
  final String title;
  final VoidCallback? didStart;
  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: kDebugMode,
      bindings: bindings,
      pages: [...page ?? [], ...pagesBuilders ?? []],
      modules: modules,
      builder: (context, routes, flutterGetItNavObserver) {
        if (didStart != null) {
          didStart!();
        }
        return AsyncStateBuilder(
          loader: ClinicasLoader(),
          builder: (navigatorObserver) => MaterialApp(
            theme: ClinicasTheme.lightTheme,
            darkTheme: ClinicasTheme.darkTheme,
            navigatorObservers: [
              flutterGetItNavObserver,
              navigatorObserver,
            ],
            routes: routes,
            title: title,
          ),
        );
      },
    );
  }
}
