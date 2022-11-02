import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class OrderTitle extends StatelessWidget {
  OrderTitle({Key? key, required this.name}) : super(key: key);
  String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Order $name',
      style: TextStyle(
        color: AppConstants().cardTitleColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}



