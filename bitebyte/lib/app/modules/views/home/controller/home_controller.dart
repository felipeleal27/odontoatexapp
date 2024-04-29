import 'package:bitebyte/app/core/local_storage/local_storage.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final LocalStorage _localStorage;

  HomeControllerBase({required LocalStorage localStorage})
      : _localStorage = localStorage;

  @observable
  String search = '';

  void clearLocalStorage() => _localStorage.clear();

  @action
  void setSearch(String? value) => search = value ?? '';

  @action
  void searchClear() => search = '';
}
