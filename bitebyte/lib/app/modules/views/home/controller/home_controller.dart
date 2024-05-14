import 'package:bitebyte/app/core/local_storage/local_storage.dart';
import 'package:bitebyte/app/modules/views/home/page/home_consultas_page.dart';
import 'package:flutter/material.dart';
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
  String dataInicial = '25/04/2024';

  @observable
  String dataFinal = '06/05/2024';

  @observable
  String professor = 'Carlos';

  @observable
  String procedimento = 'Limpeza';

  @observable
  int selectedIndex = 0;

  @computed
  bool get isAllSelected => selecteds.every((element) => element == true);

  @observable
  List<Widget> widgetOptions = <Widget>[
    const HomeConsultasPage(),
    // const HomeAgendasPage(),
  ];

  @observable
  ObservableList selecteds =
      ObservableList.of([false, false, false, false, false]);

  @observable
  bool isSelectedAll = false;

  @observable
  var showSelecteds = false;

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

  @action
  void setProfessor(String value) => professor = value;

  @action
  void onTabTapped(int index) => selectedIndex = index;

  @action
  void setShowSelect() => showSelecteds = !showSelecteds;

  @action
  void setSelecteds(List<String> value) => selecteds = ObservableList.of(value);

  @action
  void setIsSelectedAll() => isSelectedAll = !isSelectedAll;

  void setSelectedIndex(var value, int index) {
    if (selecteds.isNotEmpty) {
      selecteds[index] = value;
      if (!value) isSelectedAll = false;
      if (isAllSelected) {
        isSelectedAll = true;
      } else {
        isSelectedAll = false;
      }
    }
  }

  @action
  void selecionaTodos(var value) {
    if (selecteds.isNotEmpty) {
      for (var i = 0; i < selecteds.length; i++) {
        selecteds[i] = value;
      }
    }
  }
}
