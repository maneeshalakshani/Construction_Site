import 'package:flutter/material.dart';

class OrderDescription extends StatelessWidget {
  const OrderDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        'You can order this item as per your wish. But before accepting this order, '
            'the staff will review whether this order is a valid order or not. '
            'The order status can be checked within orders page.',
        maxLines: 6,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[600]
        ),
      ),
    );
  }
}
