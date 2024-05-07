// ignore_for_file: use_build_context_synchronously

import 'package:bitebyte/app/core/local_storage/local_storage.dart';
import 'package:bitebyte/app/core/ui/widgtes/messages.dart';
import 'package:bitebyte/app/modules/views/home/home_nome_rotas.dart';
import 'package:bitebyte/app/repository/login/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginRepository _loginRepository;
  final LocalStorage _localStorage;

  LoginControllerBase({
    required LoginRepository loginRepository,
    required LocalStorage localStorage,
  })  : _loginRepository = loginRepository,
        _localStorage = localStorage;

  @observable
  bool isObscure = true;

  @observable
  String userName = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  bool savePassword = false;

  @observable
  var isLogged = false;

  @action
  void changeObscure() => isObscure = !isObscure;

  @action
  Future<void> login(BuildContext context) async {
    isLoading = true;
    final response = await _loginRepository.login(userName, password);
    if (savePassword) {
      await _localStorage.write<String>('user', [userName, password].join('/'));
    }
    isLoading = false;
    if (response) {
      Modular.to
          .navigate('${HomeNomeRotas.modulo}${HomeNomeRotas.inicialProdutor}');
      CustomSnackbar.success(context, 'Login realizado com sucesso!');
    } else {
      CustomSnackbar.alert(context, 'Usuário ou senha inválidos!');
    }
  }

  @action
  void changeSavePassword() => savePassword = !savePassword;
}
