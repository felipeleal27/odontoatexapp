import 'package:bitebyte/app/modules/views/consultas_cliente/consultas_cliente_nome_rotas.dart';
import 'package:bitebyte/app/modules/views/consultas_cliente/controller/consultas_cliente_controller.dart';
import 'package:bitebyte/app/modules/views/consultas_cliente/page/consultas_cliente.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => ConsultasController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          ConsultasNomeRotas.inicial,
          child: (context, args) => const ConsultasClientePage(),
        ),
      ];
}
