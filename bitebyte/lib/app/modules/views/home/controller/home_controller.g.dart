// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  Computed<bool>? _$isCheckedAllComputed;

  @override
  bool get isCheckedAll =>
      (_$isCheckedAllComputed ??= Computed<bool>(() => super.isCheckedAll,
              name: 'HomeControllerBase.isCheckedAll'))
          .value;

  late final _$searchAtom =
      Atom(name: 'HomeControllerBase.search', context: context);

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$clearTextAtom =
      Atom(name: 'HomeControllerBase.clearText', context: context);

  @override
  bool get clearText {
    _$clearTextAtom.reportRead();
    return super.clearText;
  }

  @override
  set clearText(bool value) {
    _$clearTextAtom.reportWrite(value, super.clearText, () {
      super.clearText = value;
    });
  }

  late final _$isDataCheckedAtom =
      Atom(name: 'HomeControllerBase.isDataChecked', context: context);

  @override
  bool get isDataChecked {
    _$isDataCheckedAtom.reportRead();
    return super.isDataChecked;
  }

  @override
  set isDataChecked(bool value) {
    _$isDataCheckedAtom.reportWrite(value, super.isDataChecked, () {
      super.isDataChecked = value;
    });
  }

  late final _$isProfessorCheckedAtom =
      Atom(name: 'HomeControllerBase.isProfessorChecked', context: context);

  @override
  bool get isProfessorChecked {
    _$isProfessorCheckedAtom.reportRead();
    return super.isProfessorChecked;
  }

  @override
  set isProfessorChecked(bool value) {
    _$isProfessorCheckedAtom.reportWrite(value, super.isProfessorChecked, () {
      super.isProfessorChecked = value;
    });
  }

  late final _$isProcedimentoCheckedAtom =
      Atom(name: 'HomeControllerBase.isProcedimentoChecked', context: context);

  @override
  bool get isProcedimentoChecked {
    _$isProcedimentoCheckedAtom.reportRead();
    return super.isProcedimentoChecked;
  }

  @override
  set isProcedimentoChecked(bool value) {
    _$isProcedimentoCheckedAtom.reportWrite(value, super.isProcedimentoChecked,
        () {
      super.isProcedimentoChecked = value;
    });
  }

  late final _$dataInicialAtom =
      Atom(name: 'HomeControllerBase.dataInicial', context: context);

  @override
  String get dataInicial {
    _$dataInicialAtom.reportRead();
    return super.dataInicial;
  }

  @override
  set dataInicial(String value) {
    _$dataInicialAtom.reportWrite(value, super.dataInicial, () {
      super.dataInicial = value;
    });
  }

  late final _$dataFinalAtom =
      Atom(name: 'HomeControllerBase.dataFinal', context: context);

  @override
  String get dataFinal {
    _$dataFinalAtom.reportRead();
    return super.dataFinal;
  }

  @override
  set dataFinal(String value) {
    _$dataFinalAtom.reportWrite(value, super.dataFinal, () {
      super.dataFinal = value;
    });
  }

  late final _$professorAtom =
      Atom(name: 'HomeControllerBase.professor', context: context);

  @override
  String get professor {
    _$professorAtom.reportRead();
    return super.professor;
  }

  @override
  set professor(String value) {
    _$professorAtom.reportWrite(value, super.professor, () {
      super.professor = value;
    });
  }

  late final _$procedimentoAtom =
      Atom(name: 'HomeControllerBase.procedimento', context: context);

  @override
  String get procedimento {
    _$procedimentoAtom.reportRead();
    return super.procedimento;
  }

  @override
  set procedimento(String value) {
    _$procedimentoAtom.reportWrite(value, super.procedimento, () {
      super.procedimento = value;
    });
  }

  late final _$listFiltroAtom =
      Atom(name: 'HomeControllerBase.listFiltro', context: context);

  @override
  List<String> get listFiltro {
    _$listFiltroAtom.reportRead();
    return super.listFiltro;
  }

  @override
  set listFiltro(List<String> value) {
    _$listFiltroAtom.reportWrite(value, super.listFiltro, () {
      super.listFiltro = value;
    });
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void setIsDataChecked(bool value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setIsDataChecked');
    try {
      return super.setIsDataChecked(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsProfessorChecked(bool value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setIsProfessorChecked');
    try {
      return super.setIsProfessorChecked(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsProcedimentoChecked(bool value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setIsProcedimentoChecked');
    try {
      return super.setIsProcedimentoChecked(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String? value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSearch(bool value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.clearSearch');
    try {
      return super.clearSearch(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListFiltro() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setListFiltro');
    try {
      return super.setListFiltro();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfessor(String value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setProfessor');
    try {
      return super.setProfessor(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
clearText: ${clearText},
isDataChecked: ${isDataChecked},
isProfessorChecked: ${isProfessorChecked},
isProcedimentoChecked: ${isProcedimentoChecked},
dataInicial: ${dataInicial},
dataFinal: ${dataFinal},
professor: ${professor},
procedimento: ${procedimento},
listFiltro: ${listFiltro},
isCheckedAll: ${isCheckedAll}
    ''';
  }
}
