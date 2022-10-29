import 'package:app/routes/routes.gr.dart';
import 'package:flutter/material.dart';

final _appRouter = AppRouter();

void main() => runApp(MaterialApp.router(
  debugShowCheckedModeBanner: false, //remove debug_banner

  routerDelegate: _appRouter.delegate(),
  routeInformationParser: _appRouter.defaultRouteParser(),
));
