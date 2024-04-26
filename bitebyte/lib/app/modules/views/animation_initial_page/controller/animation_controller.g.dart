// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnimatedInitialPageController
    on AnimatedInitialPageControllerBase, Store {
  late final _$userAtom =
      Atom(name: 'AnimatedInitialPageControllerBase.user', context: context);

  @override
  String? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$loggedAtom =
      Atom(name: 'AnimatedInitialPageControllerBase.logged', context: context);

  @override
  bool get logged {
    _$loggedAtom.reportRead();
    return super.logged;
  }

  @override
  set logged(bool value) {
    _$loggedAtom.reportWrite(value, super.logged, () {
      super.logged = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('AnimatedInitialPageControllerBase.login', context: context);

  @override
  Future<bool> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$animatedInitialPageAsyncAction = AsyncAction(
      'AnimatedInitialPageControllerBase.animatedInitialPage',
      context: context);

  @override
  Future<void> animatedInitialPage() {
    return _$animatedInitialPageAsyncAction
        .run(() => super.animatedInitialPage());
  }

  @override
  String toString() {
    return '''
user: ${user},
logged: ${logged}
    ''';
  }
}
