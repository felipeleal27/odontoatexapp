import 'package:bitebyte/app/core/ui/widgtes/messages.dart';
import 'package:bitebyte/app/repository/login/login_repository.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginRepository _loginRepository;

  LoginControllerBase({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  @observable
  bool isObscure = true;

  @observable
  String userName = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @action
  void changeObscure() {
    isObscure = !isObscure;
  }

  Future<void> login() async {
    isLoading = true;
    final response = await _loginRepository.login(userName, password);
    isLoading = false;
    if (response) {
      Messages.success('Login realizado com sucesso!');
    } else {
      Messages.alert('Erro ao realizar login');
    }
  }
}
