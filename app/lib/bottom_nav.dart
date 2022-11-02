import 'package:app/common_data.dart';
import 'package:app/constants.dart';
import 'package:app/pages/item_list/item_list_view.dart';
import 'package:app/pages/order/order_view.dart';
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

  // List<Nav> pages = [
  //   Nav(key: 0, pages: [ItemListView(), OrderView()]),
  //   Nav(key: 1, pages: [LoginView()]),
  //   Nav(key: 2, pages: [SignUpView()]),
  // ];

  @override
  Widget build(BuildContext context) {
    bodyWidgets = [
      ItemListView(
        appCommonData: appCommonData,
      ),
      LoginView(),
      SignUpView()
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Items Available',
        ),
        backgroundColor: AppConstants().navColor,
      ),
      body: bodyWidgets.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppConstants().backgroundColor,
        unselectedItemColor: Color(0xffffffff),
        backgroundColor: AppConstants().navColor,
        iconSize: 35,
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
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}
