import 'package:app/common_data.dart';
import 'package:app/constants.dart';
import 'package:app/routes/routes.gr.dart';
import 'package:app/services/item_list_services.dart';
import 'package:app/services/order_services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PendingOrderCard extends StatefulWidget {
  PendingOrderCard({
    Key? key,
    required this.orders,
    required this.index,
    this.titleColor,
    this.needInquire,
    this.appCommonData,
    this.isPending,
    this.delete
  }) : super(key: key);
  var orders;
  int index;
  Color? titleColor;
  bool? needInquire;
  AppCommonData? appCommonData;
  bool? isPending;
  var delete;

  @override
  _PendingOrderCardState createState() => _PendingOrderCardState();
}

class _PendingOrderCardState extends State<PendingOrderCard> {
  var item;
  var itemLength;
  getItem() {
    ItemListServices()
        .getItem(widget.orders[widget.index]['itemID'])
        .then((val) async {
      if (val.data['message'] == 'Item Recieved SucessFully') {
        setState(() {
          item = val.data['Result'];
          itemLength = val.data['Result'].length;
        });
      }
    });
  }

  // deleteOrder(){
  //   OrderServices().deletePendingOrder(widget.orders[widget.index]['_id']).then((val){
  //     if(val.data['message'] == 'Order deleted Sucessfuly'){
  //       setState(() {
  //         getItem();
  //       });
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    getItem();
  }

  @override
  Widget build(BuildContext context) {
    if (itemLength == 0 || itemLength == null) {
      return Text('Loading...');
    } else {
      return Card(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order ID: ${widget.orders[widget.index]['_id']}',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: widget.titleColor ?? AppConstants().cardTitleColor),
              ),
              Text(
                'Order Status : ${widget.orders[widget.index]['orderStatus']}',
                style: TextStyle(
                    fontSize: 20.0, color: AppConstants().cardDataColor),
              ),
              Text(
                '${widget.orders[widget.index]['quantity']} ${item['unitType']} of ${item['name']}',
                style: TextStyle(
                    fontSize: 20.0, color: AppConstants().cardDataColor),
              ),
              Text(
                'Total Price : ${widget.orders[widget.index]['totPrice']}',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 20.0, color: AppConstants().cardDataColor),
              ),
              Text(
                (widget.orders[widget.index]['reason'] != null)
                    ? 'Reason : ${widget.orders[widget.index]['reason']}'
                    : 'Reason : Reason is still pending',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 18.0, color: AppConstants().cardDataColor),
              ),
              Container(
                child: (widget.needInquire != true) ? null :
                ElevatedButton(
                  onPressed: (){
                    context.router.push(InquireRoute(
                      appCommonData: widget.appCommonData!,
                      orderID: widget.orders[widget.index]['_id']
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppConstants().cardTitleColor
                  ),
                  child: const Text(
                    'Inquire',
                    style: TextStyle(
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              Container(
                child: (widget.isPending != true) ? null : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red
                  ),
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      letterSpacing: 1.0,
                    ),
                  ),
                  onPressed: (){
                    widget.delete(widget.orders[widget.index]['_id']);
                  },
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
