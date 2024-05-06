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

  @observable
  String selectedDate1 = '';

  @observable
  String selectedDate2 = '';

  @observable
  List<String> listFiltro = ObservableList.of([]);

  @action
  void setIsDataChecked(bool value) => isDataChecked = value;

  @action
  void setIsProfessorChecked(bool value) => isProfessorChecked = value;

  @action
  void setIsProcedimentoChecked(bool value) => isProcedimentoChecked = value;

  @computed
  bool get isCheckedAll =>
      isDataChecked && isProfessorChecked && isProcedimentoChecked;

  void clearLocalStorage() => _localStorage.clear();

  @action
  void setSearch(String? value) => search = value ?? '';

  @action
  void clearSearch(bool value) => clearText = value;

  @action
  void setListFiltro() {
    if (isCheckedAll) {
      listFiltro = ['Data', 'Professor', 'Procedimento'];
    } else {
      listFiltro = [];
      if (isDataChecked) {
        listFiltro.add('Data');
      }
      if (isProfessorChecked) {
        listFiltro.add('Professor');
      }
      if (isProcedimentoChecked) {
        listFiltro.add('Procedimento');
      }
    }
  }
}
