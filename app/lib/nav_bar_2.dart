// import 'package:app/constants.dart';
// import 'package:app/pages/item_list/item_list_view.dart';
// import 'package:flutter/material.dart';
// import 'package:app/pages/login/login_view.dart';
// import 'package:app/pages/register/register_view.dart';
//
// class BottomNav2View extends StatefulWidget {
//   const BottomNav2View({Key? key}) : super(key: key);
//
//   @override
//   _BottomNav2ViewState createState() => _BottomNav2ViewState();
// }
//
// class _BottomNav2ViewState extends State<BottomNav2View> {
//   int selectedIndex = 0;
//   static const List<Widget> bodyWidgets = [
//     ItemListView(),
//     LoginView(),
//     SignUpView()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: AppConstants().backgroundColor,
//       unselectedItemColor: Color(0xffffffff),
//       backgroundColor: AppConstants().navColor,
//       iconSize: 35,
//       elevation: 5,
//       currentIndex: selectedIndex,
//       onTap: (index){
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home,),
//           label: 'home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.account_circle),
//           label: 'Profile',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.info),
//           label: 'Info',
//         ),
//       ],
//     );
//   }
// }
