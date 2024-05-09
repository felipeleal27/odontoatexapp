import 'package:bitebyte/app/modules/views/consultas_cliente/consultas_cliente_nome_rotas.dart';
import 'package:bitebyte/app/modules/views/consultas_cliente/controller/consultas_cliente_controller.dart';
import 'package:bitebyte/app/modules/views/consultas_cliente/page/consultas_cliente.dart';
import 'package:bitebyte/app/modules/views/home/controller/home_controller.dart';
import 'package:bitebyte/app/modules/views/home/home_nome_rotas.dart';
import 'package:bitebyte/app/modules/views/home/page/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomeController(localStorage: i())),
        Bind.singleton((i) => ConsultasController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(HomeNomeRotas.inicialProdutor,
            child: (context, args) => const HomePage()),
        ChildRoute(ConsultasNomeRotas.inicial,
            child: (context, args) => const ConsultasClientePage())
      ];
}
