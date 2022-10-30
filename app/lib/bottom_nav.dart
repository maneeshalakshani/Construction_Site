import 'package:app/constants.dart';
import 'package:app/pages/item_list/item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/login/login_view.dart';
import 'package:app/pages/register/register_view.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  _BottomNavViewState createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int selectedIndex = 0;
  static const List<Widget> bodyWidgets = [
    ItemListView(),
    LoginView(),
    SignUpView()
  ];

  @override
  Widget build(BuildContext context) {
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
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
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
