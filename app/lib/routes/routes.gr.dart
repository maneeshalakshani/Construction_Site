// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../bottom_nav.dart' as _i4;
import '../common_data.dart' as _i10;
import '../pages/inquire/inquire_view.dart' as _i7;
import '../pages/item_list/item_list_view.dart' as _i2;
import '../pages/login/login_view.dart' as _i1;
import '../pages/order/order_view.dart' as _i5;
import '../pages/pending_orders/pending_orders_view.dart' as _i6;
import '../pages/register/register_view.dart' as _i3;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginView(),
      );
    },
    ItemListRoute.name: (routeData) {
      final args = routeData.argsAs<ItemListRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ItemListView(
          key: args.key,
          appCommonData: args.appCommonData,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignUpView(),
      );
    },
    BottomNavRoute.name: (routeData) {
      final args = routeData.argsAs<BottomNavRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.BottomNavView(
          key: args.key,
          appCommonData: args.appCommonData,
        ),
      );
    },
    OrderRoute.name: (routeData) {
      final args = routeData.argsAs<OrderRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.OrderView(
          key: args.key,
          itemID: args.itemID,
          appCommonData: args.appCommonData,
        ),
      );
    },
    PendingOrdersRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.PendingOrdersView(),
      );
    },
    InquireRoute.name: (routeData) {
      final args = routeData.argsAs<InquireRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.InquireView(
          key: args.key,
          appCommonData: args.appCommonData,
          orderID: args.orderID,
        ),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          ItemListRoute.name,
          path: '/item_list',
        ),
        _i8.RouteConfig(
          SignUpRoute.name,
          path: '/signUp',
        ),
        _i8.RouteConfig(
          BottomNavRoute.name,
          path: '/nav',
        ),
        _i8.RouteConfig(
          OrderRoute.name,
          path: '/order',
        ),
        _i8.RouteConfig(
          PendingOrdersRoute.name,
          path: '/pending_orders',
        ),
        _i8.RouteConfig(
          InquireRoute.name,
          path: '/inquire_rejected_orders',
        ),
      ];
}

/// generated route for
/// [_i1.LoginView]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.ItemListView]
class ItemListRoute extends _i8.PageRouteInfo<ItemListRouteArgs> {
  ItemListRoute({
    _i9.Key? key,
    required dynamic appCommonData,
  }) : super(
          ItemListRoute.name,
          path: '/item_list',
          args: ItemListRouteArgs(
            key: key,
            appCommonData: appCommonData,
          ),
        );

  static const String name = 'ItemListRoute';
}

class ItemListRouteArgs {
  const ItemListRouteArgs({
    this.key,
    required this.appCommonData,
  });

  final _i9.Key? key;

  final dynamic appCommonData;

  @override
  String toString() {
    return 'ItemListRouteArgs{key: $key, appCommonData: $appCommonData}';
  }
}

/// generated route for
/// [_i3.SignUpView]
class SignUpRoute extends _i8.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signUp',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i4.BottomNavView]
class BottomNavRoute extends _i8.PageRouteInfo<BottomNavRouteArgs> {
  BottomNavRoute({
    _i9.Key? key,
    required _i10.AppCommonData appCommonData,
  }) : super(
          BottomNavRoute.name,
          path: '/nav',
          args: BottomNavRouteArgs(
            key: key,
            appCommonData: appCommonData,
          ),
        );

  static const String name = 'BottomNavRoute';
}

class BottomNavRouteArgs {
  const BottomNavRouteArgs({
    this.key,
    required this.appCommonData,
  });

  final _i9.Key? key;

  final _i10.AppCommonData appCommonData;

  @override
  String toString() {
    return 'BottomNavRouteArgs{key: $key, appCommonData: $appCommonData}';
  }
}

/// generated route for
/// [_i5.OrderView]
class OrderRoute extends _i8.PageRouteInfo<OrderRouteArgs> {
  OrderRoute({
    _i9.Key? key,
    required String itemID,
    required _i10.AppCommonData appCommonData,
  }) : super(
          OrderRoute.name,
          path: '/order',
          args: OrderRouteArgs(
            key: key,
            itemID: itemID,
            appCommonData: appCommonData,
          ),
        );

  static const String name = 'OrderRoute';
}

class OrderRouteArgs {
  const OrderRouteArgs({
    this.key,
    required this.itemID,
    required this.appCommonData,
  });

  final _i9.Key? key;

  final String itemID;

  final _i10.AppCommonData appCommonData;

  @override
  String toString() {
    return 'OrderRouteArgs{key: $key, itemID: $itemID, appCommonData: $appCommonData}';
  }
}

/// generated route for
/// [_i6.PendingOrdersView]
class PendingOrdersRoute extends _i8.PageRouteInfo<void> {
  const PendingOrdersRoute()
      : super(
          PendingOrdersRoute.name,
          path: '/pending_orders',
        );

  static const String name = 'PendingOrdersRoute';
}

/// generated route for
/// [_i7.InquireView]
class InquireRoute extends _i8.PageRouteInfo<InquireRouteArgs> {
  InquireRoute({
    _i9.Key? key,
    required _i10.AppCommonData appCommonData,
    required String orderID,
  }) : super(
          InquireRoute.name,
          path: '/inquire_rejected_orders',
          args: InquireRouteArgs(
            key: key,
            appCommonData: appCommonData,
            orderID: orderID,
          ),
        );

  static const String name = 'InquireRoute';
}

class InquireRouteArgs {
  const InquireRouteArgs({
    this.key,
    required this.appCommonData,
    required this.orderID,
  });

  final _i9.Key? key;

  final _i10.AppCommonData appCommonData;

  final String orderID;

  @override
  String toString() {
    return 'InquireRouteArgs{key: $key, appCommonData: $appCommonData, orderID: $orderID}';
  }
}
