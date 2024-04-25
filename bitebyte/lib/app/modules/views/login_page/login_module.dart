import 'package:bitebyte/app/modules/login_page/controller/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frota_de_bolso/app/modules/feature/login/controller/login_controller.dart';
import 'package:frota_de_bolso/app/modules/feature/login/login_nome_rota.dart';
import 'package:frota_de_bolso/app/modules/feature/login/page/login_page.dart';
import 'package:frota_de_bolso/app/repository/atividades_operador/atividades_repository.dart';
import 'package:frota_de_bolso/app/repository/atividades_operador/atividades_repository_impl.dart';
import 'package:frota_de_bolso/app/repository/sincronizar/sincronizar_dados_repository.dart';

import '../../../repository/sincronizar/sincronizar_dados_repository_impl.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => LoginController(
            loginRepository: i(),
            localStorage: i(),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          LoginNomeRotas.login,
          child: (context, args) => const LoginPage(),
        ),
      ];
}
