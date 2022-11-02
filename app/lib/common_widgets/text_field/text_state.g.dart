// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextState on TextFieldClass, Store {
  late final _$obscureTextAtom =
      Atom(name: 'TextFieldClass.obscureText', context: context);

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  late final _$isPasswordAtom =
      Atom(name: 'TextFieldClass.isPassword', context: context);

  @override
  bool get isPassword {
    _$isPasswordAtom.reportRead();
    return super.isPassword;
  }

  @override
  set isPassword(bool value) {
    _$isPasswordAtom.reportWrite(value, super.isPassword, () {
      super.isPassword = value;
    });
  }

  late final _$TextFieldClassActionController =
      ActionController(name: 'TextFieldClass', context: context);

  @override
  void setObscureText() {
    final _$actionInfo = _$TextFieldClassActionController.startAction(
        name: 'TextFieldClass.setObscureText');
    try {
      return super.setObscureText();
    } finally {
      _$TextFieldClassActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obscureText: ${obscureText},
isPassword: ${isPassword}
    ''';
  }
}
