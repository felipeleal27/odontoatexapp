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

  @observable
  bool clearText = false;

  @observable
  bool isDataChecked = false;

  @observable
  bool isProfessorChecked = false;

  @observable
  bool isProcedimentoChecked = false;

  @action
  void setIsChecked(bool value, bool isChecked) => isDataChecked = value;

  void clearLocalStorage() => _localStorage.clear();

  @action
  void setSearch(String? value) => search = value ?? '';

  @action
  void clearSearch(bool value) => clearText = value;
}
