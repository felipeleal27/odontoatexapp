import 'package:bitebyte/app/core/local_storage/local_storage.dart';
import 'package:bitebyte/app/modules/views/animation_initial_page/animation_initial_nome_rotas.dart';
import 'package:bitebyte/app/repository/login/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'animation_controller.g.dart';

class AnimatedInitialPageController = AnimatedInitialPageControllerBase
    with _$AnimatedInitialPageController;

abstract class AnimatedInitialPageControllerBase with Store {
  final LocalStorage _localStorage;
  final LoginRepository _loginRepository;

  AnimatedInitialPageControllerBase({
    required LocalStorage localStorage,
    required LoginRepository loginRepository,
  })  : _localStorage = localStorage,
        _loginRepository = loginRepository;

  @observable
  String? user = '';

  @observable
  bool logged = false;

  @action
  Future<bool> login() async {
    bool response = false;
    user = await _localStorage.read<String>('user');
    if (user != null) {
      response = await _loginRepository.login(
          user!.split('/')[0], user!.split('/')[1]);
    }
    return response;
  }

  @action
  Future<void> animatedInitialPage() async {
    Modular.to.pushNamed(
        '${AnimatedInitialNomeRotas.modulo}/${AnimatedInitialNomeRotas.initial}');
  }
}
