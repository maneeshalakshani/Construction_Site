import 'package:app/common_widgets/text_field/text_state.dart';
import 'package:flutter/material.dart';

Widget textField({
  required String initialValue,
  required void Function(String)? onChanged,
  required String? Function(String?)? validator,
  required String label,
  required String hintText,
  required BuildContext context,
}){
  double paddingTop = 10;
  double paddingBottom = 30;
  Color fillColor = Colors.white;
  Color labelColor = Colors.white;
  TextState state = TextState();

  return Container(
      padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0, left: 10),
            child: Text(
              label,
              style: TextStyle(
                color: labelColor,
                fontSize: 20,
              ),
            ),
          ),
          TextFormField(
            initialValue: initialValue,
            onChanged: onChanged,
            validator: validator,
            obscureText: state.obscureText,
            decoration: InputDecoration(
              // label: Text(label),
              // labelStyle: TextStyle(
              //   color: labelColor,
              // ),
              filled: true,
              fillColor: fillColor,
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
