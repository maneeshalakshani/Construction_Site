import 'package:mobx/mobx.dart';

part 'text_state.g.dart';

/// Use Command
/// <-- flutter packages pub run build_runner build -->
/// or
/// <-- flutter packages pub run build_runner watch --delete-conflicting-outputs -->

class TextState = TextFieldClass with _$TextState;

abstract class TextFieldClass with Store{
  @observable
  bool obscureText = false;

  @observable
  bool isPassword = false;

  @action
  void setObscureText(){
    obscureText = !obscureText;
  }
}