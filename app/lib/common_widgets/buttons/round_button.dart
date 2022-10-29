import 'package:flutter/material.dart';

Widget roundButton({
  required double width,
  Color? btnColor,
  required var onPressed,
  required String title,
  double? topMargin,
}){
  return Container(
    margin: EdgeInsets.only(top: topMargin ?? 0),
    width: width*0.6,
    child: ElevatedButton(
      onPressed: (){
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        primary: btnColor ?? Colors.teal,
        padding: EdgeInsets.symmetric(horizontal: width*0.2, vertical: width*0.03),
        shape: StadiumBorder(),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
      ),
    ),
  );
}