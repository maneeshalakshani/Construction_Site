import 'package:app/common_data.dart';
import 'package:app/constants.dart';
import 'package:app/pages/accepted_orders/accepted_orders_view.dart';
import 'package:app/pages/item_list/item_list_view.dart';
import 'package:app/pages/order/order_view.dart';
import 'package:app/pages/pending_orders/pending_orders_view.dart';
import 'package:app/pages/rejected_orders.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/login/login_view.dart';
import 'package:app/pages/register/register_view.dart';

// class Nav{
//   late int key;
//   late List<Widget> pages;
//
//   Nav({required this.key, required this.pages});
// }

class BottomNavView extends StatefulWidget {
  BottomNavView({Key? key, required this.appCommonData}) : super(key: key);
  AppCommonData appCommonData;

  @override
  _BottomNavViewState createState() => _BottomNavViewState(this.appCommonData);
}

class _BottomNavViewState extends State<BottomNavView> {
  AppCommonData appCommonData;
  _BottomNavViewState(this.appCommonData);

  int selectedIndex = 0;
  late List<Widget> bodyWidgets;

  @override
  Widget build(BuildContext context) {
    bodyWidgets = [
      ItemListView(
        appCommonData: appCommonData,
      ),
      PendingOrdersView(),
      AcceptedOrdersView(),
      RejectedOrdersView(),
      // SignUpView()
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Site Manager',
        ),
        backgroundColor: AppConstants().navColor,
      ),
      body: bodyWidgets.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppConstants().backgroundColor,
        unselectedItemColor: Color(0xffffffff),
        backgroundColor: AppConstants().navColor,
        iconSize: 30,
        elevation: 5,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: 'pending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: 'accepted',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: 'rejected',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.account_circle),
          //   label: 'Profile',
          // ),
        ],
      ),
    );
  }
}
