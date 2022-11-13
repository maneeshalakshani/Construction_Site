import 'package:app/common_data.dart';
import 'package:app/common_widgets/appBar.dart';
import 'package:app/common_widgets/buttons/normal_button.dart';
import 'package:app/common_widgets/buttons/round_button.dart';
import 'package:app/common_widgets/drop_down.dart';
import 'package:app/common_widgets/null_error.dart';
import 'package:app/common_widgets/text_field/text_field_widget.dart';
import 'package:app/constants.dart';
import 'package:app/pages/order/order_description.dart';
import 'package:app/common_widgets/title.dart';
import 'package:app/routes/routes.gr.dart';
import 'package:app/services/auth_services.dart';
import 'package:app/services/item_list_services.dart';
import 'package:app/services/order_services.dart';
import 'package:app/services/supplier_services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderView extends StatefulWidget {
  OrderView({Key? key, required this.itemID, required this.appCommonData})
      : super(key: key);
  String itemID;
  AppCommonData appCommonData;

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  var item;
  void getItem() {
    ItemListServices().getItem(widget.itemID).then((val) async {
      setState(() {
        item = val.data['Result'];
      });
    });
  }

  getAllSuppliers(){
    SupplierServices().getSuppliers().then((val){
      if(val.data['message'] == 'Suppliers fetched'){
        setState(() {
          for(var s in val.data['Result']){
            userList.add(s['businessName']);
          }
        });
      }
    });
  }

  int calculateTotal(int quantity, int unitPrice) {
    return quantity * unitPrice;
  }

  @override
  void initState() {
    super.initState();
    getItem();
    getAllSuppliers();
  }

  late int? quantity;
  late int total;
  late String address;
  late String email;
  late String userID;
  // late String itemID;

  var userList = ['None'];
  String? userValue;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (item == null) {
      return NullError();
    } else {
      return Scaffold(
        appBar: AppBarWidget(
          context: context,
          appCommonData: widget.appCommonData
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
                    validator: true,
                    errMsg: 'Please Enter No of units',
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
                  validator: true,
                  errMsg: 'Please Enter Delivery Address',
                  onChanged: (val) {
                    address = val;
                  },
                  label: 'Delivery Address',
                  hintText: 'Enter delivery address',
                  labelColor: Colors.black,
                ),
                DropDown(
                  speciesList: userList,
                  itemValue: userValue,
                  label: 'Select Supplier',
                  labelColor: Colors.black,
                  onChange: (value){
                    setState(() {
                      userValue = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    normalButton(
                        width: 550,
                        title: 'Add Order',
                        onPressed: () {
                          OrderServices().addOrder(quantity!, widget.appCommonData.userID, item['_id'], total, address).then((order) {
                            if (order.data['message'] == 'Order Added') {
                              Fluttertoast.showToast(
                                msg: 'Order Added',
                                textColor: Colors.white,
                                backgroundColor: Colors.green,
                                //gravity: ToastGravity.BOTTOM
                              );
                              context.router.push(BottomNavRoute(appCommonData: widget.appCommonData));
                            }
                          });
                          // AuthenticationServices().getUserFromEmail(email).then((user) {
                          //   if (user.data['status'] == 'Ok') {
                          //     userID = user.data['data']['_id'];
                          //     OrderServices().addOrder(quantity!, userID, item['_id'], total, address).then((order) {
                          //       if (order.data['message'] == 'Order Added') {
                          //         context.router.push(BottomNavRoute(appCommonData: widget.appCommonData));
                          //       }
                          //     });
                          //   }
                          // });
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
