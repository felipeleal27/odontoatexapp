import 'package:bitebyte/app/modules/views/animation_initial_page/page/animated_logo.dart';
import 'package:bitebyte/app/modules/views/animation_initial_page/animation_initial_nome_rotas.dart';
import 'package:bitebyte/app/modules/views/animation_initial_page/controller/animation_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnimationInitialModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => AnimatedInitialPageController(
            localStorage: i(),
            loginRepository: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AnimatedInitialNomeRotas.initial,
          child: (context, args) => const SplashScreen(),
        ),
      ];
}
