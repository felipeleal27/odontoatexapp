import 'package:bitebyte/app/modules/views/animation_initial_page/animation_initial_nome_rotas.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'animation_controller.g.dart';

class AnimatedInitialPageController = AnimatedInitialPageControllerBase
    with _$AnimatedInitialPageController;

abstract class AnimatedInitialPageControllerBase with Store {
  @action
  Future<void> animatedInitialPage() async {
    Modular.to.pushNamed(
        '${AnimatedInitialNomeRotas.modulo}/${AnimatedInitialNomeRotas.initial}');
  }
}
