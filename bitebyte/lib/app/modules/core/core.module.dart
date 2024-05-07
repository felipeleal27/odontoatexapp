import 'package:bitebyte/app/core/local_storage/local_storage.dart';
import 'package:bitebyte/app/core/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import 'package:bitebyte/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:bitebyte/app/core/rest_client/rest_client.dart';
import 'package:bitebyte/app/repository/login/login_repository.dart';
import 'package:bitebyte/app/repository/login/login_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<RestClient>((i) => DioRestClient(), export: true),
    Bind.lazySingleton<LocalStorage>((i) => SharedPreferencesLocalStorageImpl(),
        export: true),
    Bind.singleton<LoginRepository>((i) => LoginRepositoryImpl(), export: true),
  ];
}
