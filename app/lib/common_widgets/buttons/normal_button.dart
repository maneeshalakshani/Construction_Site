import 'package:flutter/material.dart';

Widget normalButton({
  required double width,
  Color? btnColor,
  required var onPressed,
  required String title,
  double? topMargin,
  Color? textColor,
}) {
  return Container(
    margin: EdgeInsets.only(top: topMargin ?? 0),
    //width: width*0.6,
    child: ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        primary: btnColor ?? Colors.teal,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        //shape: StadiumBorder(),
      ),
      child: Text(
        title,
        style: TextStyle(color: textColor ?? Colors.black, fontSize: 18),
      ),
    ),
  );
}
