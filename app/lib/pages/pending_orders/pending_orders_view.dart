import 'package:app/common_widgets/null_error.dart';
import 'package:app/constants.dart';
import 'package:app/common_widgets/pending_order_card.dart';
import 'package:app/services/item_list_services.dart';
import 'package:app/services/order_services.dart';
import 'package:flutter/material.dart';

class PendingOrdersView extends StatefulWidget {
  const PendingOrdersView({Key? key}) : super(key: key);

  @override
  _PendingOrdersViewState createState() => _PendingOrdersViewState();
}

class _PendingOrdersViewState extends State<PendingOrdersView> {
  var orders;
  var ordersLength;

  void getPendingOrders() {
    OrderServices().getPendingOrders().then((ordersVal) async {
      setState(() {
        orders = ordersVal.data['Result'];
        ordersLength = ordersVal.data['Result'].length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPendingOrders();
  }

  @override
  Widget build(BuildContext context) {
    if (ordersLength == 0 || ordersLength == null) {
      return NullError();
    } else {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppConstants().insideBackgroundColor,
          body: ListView.builder(
            itemCount: ordersLength,
            itemBuilder: (BuildContext context, int index) {
              return PendingOrderCard(orders: orders, index: index);
            },
          ),
        ),
      );
    }
  }
}
