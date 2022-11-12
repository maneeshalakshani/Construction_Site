import 'package:app/common_widgets/text_field/text_state.dart';
import 'package:flutter/material.dart';

Widget textField({
  required String initialValue,
  required void Function(String)? onChanged,
  required bool validator,
  required String label,
  required String hintText,
  required BuildContext context,
  Color? fillColor,
  Color? labelColor,
  double? paddingTop,
  TextInputType? textInputType,
  int? maxLines,
  String? errMsg
}){
  double defaultPaddingTop = 10;
  double paddingBottom = 30;
  Color defaultFillColor = Colors.white;
  Color defaultLabelColor = Colors.white;
  TextState state = TextState();

  return Container(
      padding: EdgeInsets.only(top: paddingTop ?? defaultPaddingTop, bottom: paddingBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0, left: 10),
            child: Text(
              label,
              style: TextStyle(
                color: labelColor ?? defaultLabelColor,
                fontSize: 20,
              ),
            ),
          ),
          TextFormField(
            initialValue: initialValue,
            onChanged: onChanged,
            //validator: validator,
            validator: validator != true ? null : (String? value) {
              if (value == null || value.isEmpty) {
                return errMsg;
              } else {
                return null;
              }
            },
            obscureText: state.obscureText,
            keyboardType: textInputType,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
              // label: Text(label),
              // labelStyle: TextStyle(
              //   color: labelColor,
              // ),
              filled: true,
              fillColor: fillColor ?? defaultFillColor,
              hintText: hintText,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
              suffixIcon: passwordViewIcon(state, context),
            ),
          ),
        ],
      ));
}


Widget? passwordViewIcon(
    TextState state, BuildContext context) {
  if (state.isPassword) {
    return GestureDetector(
        onTap: () {
          state.setObscureText();
        },
        child: Icon(
          state.obscureText == true ? Icons.visibility : Icons.visibility_off,
          color: Color(0xFFAA6619),
        ));
  } else {
    return null;
  }
}
