import 'package:app/common_data.dart';
import 'package:app/common_widgets/null_error.dart';
import 'package:app/constants.dart';
import 'package:app/common_widgets/pending_order_card.dart';
import 'package:app/services/order_services.dart';
import 'package:flutter/material.dart';

class RejectedOrdersView extends StatefulWidget {
  RejectedOrdersView({Key? key, required this.appCommonData}) : super(key: key);
  AppCommonData appCommonData;

  @override
  _RejectedOrdersViewState createState() => _RejectedOrdersViewState();
}

class _RejectedOrdersViewState extends State<RejectedOrdersView> {
  var orders;
  var ordersLength;

  void getRejectedOrders() {
    OrderServices().getRejectedOrders().then((ordersVal) async {
      setState(() {
        orders = ordersVal.data['Result'];
        ordersLength = ordersVal.data['Result'].length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getRejectedOrders();
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
              return PendingOrderCard(
                orders: orders,
                index: index,
                titleColor: Colors.red,
                needInquire: true,
                appCommonData: widget.appCommonData,
              );
            },
          ),
        ),
      );
    }
  }
}
