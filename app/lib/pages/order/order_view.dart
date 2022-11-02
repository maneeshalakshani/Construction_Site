import 'package:app/common_widgets/buttons/normal_button.dart';
import 'package:app/common_widgets/buttons/round_button.dart';
import 'package:app/common_widgets/null_error.dart';
import 'package:app/common_widgets/text_field/text_field_widget.dart';
import 'package:app/constants.dart';
import 'package:app/pages/order/order_description.dart';
import 'package:app/pages/order/title.dart';
import 'package:app/routes/routes.gr.dart';
import 'package:app/services/auth_services.dart';
import 'package:app/services/item_list_services.dart';
import 'package:app/services/order_services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class OrderView extends StatefulWidget {
  OrderView({Key? key, required this.itemID}) : super(key: key);
  String itemID;

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  var item;
  void getItem() {
    ItemListServices().getItem(widget.itemID).then((val) async {
      print(val.data['Result']);
      setState(() {
        item = val.data['Result'];
      });
    });
  }

  int calculateTotal(int quantity, int unitPrice) {
    return quantity * unitPrice;
  }

  @override
  void initState() {
    super.initState();
    getItem();
  }

  late int? quantity;
  late int total;
  late String address;
  late String email;
  late String userID;
  // late String itemID;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (item == null) {
      return NullError();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Order Item',
          ),
          backgroundColor: AppConstants().navColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.1, vertical: width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderTitle(name: item['name']),
                OrderDescription(),
                textField(
                    context: context,
                    initialValue: '',
                    validator: (val) {},
                    onChanged: (val) {
                      quantity = int.parse(val);
                      total = calculateTotal(quantity!, item['unitPrice']);
                    },
                    label: item['unitType'],
                    hintText: 'Enter no of ${item['unitType']}',
                    labelColor: Colors.black,
                    paddingTop: 30,
                    textInputType: TextInputType.number),
                textField(
                  context: context,
                  initialValue: '',
                  validator: (val) {},
                  onChanged: (val) {
                    address = val;
                  },
                  label: 'Delivery Address',
                  hintText: 'Enter delivery address',
                  labelColor: Colors.black,
                ),
                textField(
                  context: context,
                  initialValue: '',
                  validator: (val) {},
                  onChanged: (val) {
                    email = val;
                  },
                  label: 'User email',
                  hintText: 'Enter your email',
                  labelColor: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    normalButton(
                        width: 550,
                        title: 'Add Order',
                        onPressed: () {
                          AuthenticationServices()
                              .getUserFromEmail(email)
                              .then((user) {
                            if (user.data['status'] == 'Ok') {
                              userID = user.data['data']['_id'];
                              OrderServices()
                                  .addOrder(quantity!, userID, item['_id'],
                                      total, address)
                                  .then((order) {
                                if (order.data['message'] == 'Order Added') {
                                  context.router.push(ItemListRoute());
                                }
                              });
                            }
                          });
                        },
                        btnColor: AppConstants().cardTitleColor,
                        textColor: Colors.white),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
