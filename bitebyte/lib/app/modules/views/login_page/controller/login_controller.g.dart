// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  late final _$isObscureAtom =
      Atom(name: 'LoginControllerBase.isObscure', context: context);

  @override
  bool get isObscure {
    _$isObscureAtom.reportRead();
    return super.isObscure;
  }

  @override
  set isObscure(bool value) {
    _$isObscureAtom.reportWrite(value, super.isObscure, () {
      super.isObscure = value;
    });
  }

  late final _$userNameAtom =
      Atom(name: 'LoginControllerBase.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'LoginControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'LoginControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$savePasswordAtom =
      Atom(name: 'LoginControllerBase.savePassword', context: context);

  @override
  bool get savePassword {
    _$savePasswordAtom.reportRead();
    return super.savePassword;
  }

  @override
  set savePassword(bool value) {
    _$savePasswordAtom.reportWrite(value, super.savePassword, () {
      super.savePassword = value;
    });
  }

  late final _$isLoggedAtom =
      Atom(name: 'LoginControllerBase.isLogged', context: context);

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginControllerBase.login', context: context);

  @override
  Future<void> login(BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(context));
  }

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  void changeObscure() {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.changeObscure');
    try {
      return super.changeObscure();
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSavePassword() {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.changeSavePassword');
    try {
      return super.changeSavePassword();
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isObscure: ${isObscure},
userName: ${userName},
password: ${password},
isLoading: ${isLoading},
savePassword: ${savePassword},
isLogged: ${isLogged}
    ''';
  }
}
