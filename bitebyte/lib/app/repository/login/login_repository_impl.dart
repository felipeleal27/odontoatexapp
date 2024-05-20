// import 'package:bitebyte/app/core/local_storage/local_storage.dart';
// import 'package:bitebyte/app/core/rest_client/rest_client.dart';
import 'package:bitebyte/app/repository/login/login_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LoginRepositoryImpl extends LoginRepository {
  // final RestClient _restClient;
  // final LocalStorage _localStorage;

  // LoginRepositoryImpl({
  //   required RestClient restClient,
  //   required LocalStorage localStorage,
  // })  : _localStorage = localStorage,
  //       _restClient = restClient;

  @override
  Future<bool> login(String userName, String password) async {
    try {
      // var response = await _restClient.post('/api/Auth/login',
      //     data: {'email': 'adm@adm.com', 'password': 'senha forte'});

      // if (response.statusCode == 200) {
      //   await _localStorage.write<String>(
      //       'token', response.data["result"]["token"]);

      //   return true;
      // } else {
      //   return false;
      // }

      //HTTP:
      var response = await http.post(
        Uri.parse('https://localhost:7500/api/Auth/login'),
        body: {'email': userName, 'password': password},
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }

      // return Future.delayed(const Duration(seconds: 3), () {
      //   if ((userName == 'adm@adm.com' && password == 'senha forte') ||
      //       (userName == 'felipe' && password == '123') ||
      //       (userName == '' && password == '')) {
      //     return true;
      //   } else {
      //     return false;
      //   }
      // });
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao realizar login: $e');
      }

      return false;
    }
  }
}
