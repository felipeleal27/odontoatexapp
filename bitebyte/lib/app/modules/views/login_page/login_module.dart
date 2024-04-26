import 'package:bitebyte/app/modules/views/login_page/controller/login_controller.dart';
import 'package:bitebyte/app/modules/views/login_page/login_nome_rota.dart';
import 'package:bitebyte/app/modules/views/login_page/page/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => LoginController(loginRepository: i()),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(LoginNomeRotas.login,
            child: (context, args) => const LoginPage()),
      ];
}
