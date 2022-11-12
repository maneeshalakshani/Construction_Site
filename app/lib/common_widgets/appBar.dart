import 'package:app/common_data.dart';
import 'package:app/constants.dart';
import 'package:app/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget AppBarWidget({
  required BuildContext context,
  required AppCommonData appCommonData
}){
  return AppBar(
    title: Text('Site Manager'),
    backgroundColor: AppConstants().navColor,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 0),
        child: IconButton(
          icon: Icon(Icons.home),
          onPressed: (){
            context.router.push(BottomNavRoute(appCommonData: appCommonData));
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: IconButton(
          icon: Icon(Icons.logout),
          onPressed: (){
            context.router.push(LoginRoute());
          },
        ),
      )
    ],
  );
}