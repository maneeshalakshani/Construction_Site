import 'package:app/common_widgets/null_error.dart';
import 'package:app/constants.dart';
import 'package:app/common_widgets/pending_order_card.dart';
import 'package:app/services/order_services.dart';
import 'package:flutter/material.dart';

class AcceptedOrdersView extends StatefulWidget {
  const AcceptedOrdersView({Key? key}) : super(key: key);

  @override
  _AcceptedOrdersViewState createState() => _AcceptedOrdersViewState();
}

class _AcceptedOrdersViewState extends State<AcceptedOrdersView> {
  var orders;
  var ordersLength;

  void getAcceptedOrders() {
    OrderServices().getAcceptedOrders().then((ordersVal) async {
      setState(() {
        orders = ordersVal.data['Result'];
        ordersLength = ordersVal.data['Result'].length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getAcceptedOrders();
  }

  @override
  Widget build(BuildContext context) {
    //getPendingOrders();

    if (ordersLength == 0 || ordersLength == null) {
      return NullError();
    } else {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppConstants().insideBackgroundColor,
          body: ListView.builder(
            itemCount: ordersLength,
            itemBuilder: (BuildContext context, int index) {
              return PendingOrderCard(
                orders: orders,
                index: index,
                titleColor: Colors.greenAccent,
              );
            },
          ),
        ),
      );
    }
  }
}
