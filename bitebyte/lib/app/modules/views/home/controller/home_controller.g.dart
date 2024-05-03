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
  String toString() {
    return '''
search: ${search},
clearText: ${clearText},
isDataChecked: ${isDataChecked},
isProfessorChecked: ${isProfessorChecked},
isProcedimentoChecked: ${isProcedimentoChecked},
isCheckedAll: ${isCheckedAll}
    ''';
  }
}
