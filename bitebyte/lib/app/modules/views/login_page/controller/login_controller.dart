import 'package:bitebyte/app/core/local_storage/local_storage.dart';
import 'package:bitebyte/app/core/ui/widgtes/messages.dart';
import 'package:bitebyte/app/repository/login/login_repository.dart';

class LoginController {
  final LoginRepository _loginRepository;
  final LocalStorage _localStorage;

  LoginController({
    required LoginRepository loginRepository,
    required LocalStorage localStorage,
  })  : _loginRepository = loginRepository,
        _localStorage = localStorage;

  bool isObscure = true;
  String userName = '';
  String password = '';
  void changeObscure() {
    isObscure = !isObscure;
  }

  Future<void> login() async {
    final response = await _loginRepository.login(userName, password);
    Messages.alert(response);
  }
}
