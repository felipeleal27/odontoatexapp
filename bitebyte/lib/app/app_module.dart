import 'package:bitebyte/app/modules/core/core.module.dart';
import 'package:bitebyte/app/modules/views/animation_initial_page/animation_initial_module.dart';
import 'package:bitebyte/app/modules/views/animation_initial_page/animation_initial_nome_rotas.dart';
import 'package:bitebyte/app/modules/views/animation_initial_page/controller/animation_controller.dart';
import 'package:bitebyte/app/modules/views/home/home_module.dart';
import 'package:bitebyte/app/modules/views/home/home_nome_rotas.dart';
import 'package:bitebyte/app/modules/views/login_page/login_module.dart';
import 'package:bitebyte/app/modules/views/login_page/login_nome_rotas.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => AnimatedInitialPageController(
        localStorage: i(),
        loginRepository: i(),
      ),
    )
  ];

  @override
  List<Module> get imports => [CoreModule()];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(AnimatedInitialNomeRotas.modulo,
        module: AnimationInitialModule()),
    ModuleRoute(LoginNomeRotas.modulo, module: LoginModule()),
    ModuleRoute(HomeNomeRotas.modulo, module: HomeModule()),
  ];
}
