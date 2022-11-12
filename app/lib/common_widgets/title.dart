import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class OrderTitle extends StatelessWidget {
  OrderTitle({
    Key? key,
    this.name,
    this.title,
  }) : super(key: key);
  String? name;
  String? title;


  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? 'Order $name',
      style: TextStyle(
        color: AppConstants().cardTitleColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}



