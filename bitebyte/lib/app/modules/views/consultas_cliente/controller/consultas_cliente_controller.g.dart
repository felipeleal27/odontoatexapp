// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultas_cliente_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConsultasController on ConsultasControllerBase, Store {
  late final _$viewPDFLoadignAtom =
      Atom(name: 'ConsultasControllerBase.viewPDFLoadign', context: context);

  @override
  bool get viewPDFLoadign {
    _$viewPDFLoadignAtom.reportRead();
    return super.viewPDFLoadign;
  }

  @override
  set viewPDFLoadign(bool value) {
    _$viewPDFLoadignAtom.reportWrite(value, super.viewPDFLoadign, () {
      super.viewPDFLoadign = value;
    });
  }

  late final _$viewPdfAsyncAction =
      AsyncAction('ConsultasControllerBase.viewPdf', context: context);

  @override
  Future viewPdf(BuildContext context, String date, String prof) {
    return _$viewPdfAsyncAction.run(() => super.viewPdf(context, date, prof));
  }

  late final _$ConsultasControllerBaseActionController =
      ActionController(name: 'ConsultasControllerBase', context: context);

  @override
  void setLoadingViewPDF() {
    final _$actionInfo = _$ConsultasControllerBaseActionController.startAction(
        name: 'ConsultasControllerBase.setLoadingViewPDF');
    try {
      return super.setLoadingViewPDF();
    } finally {
      _$ConsultasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
viewPDFLoadign: ${viewPDFLoadign}
    ''';
  }
}
