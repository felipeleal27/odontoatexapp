import 'package:asuka/asuka.dart';
import 'package:bitebyte/app/core/ui/widgtes/ui_config.dart';
import 'package:bitebyte/app/modules/views/animation_initial_page/animation_initial_nome_rotas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(
        "${AnimatedInitialNomeRotas.modulo}${AnimatedInitialNomeRotas.initial}");
    Modular.setObservers([Asuka.asukaHeroController]);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, child) {
        return MaterialApp.router(
          builder: (context, child) {
            return Asuka.builder(context, child);
          },
          title: UiConfig.title,
          debugShowCheckedModeBanner: false,
          theme: UiConfig.themelight,
          darkTheme: UiConfig.themelight,
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('pt', 'BR')],
        );
      },
    );
  }
}
