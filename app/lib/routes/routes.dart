import 'package:app/bottom_nav.dart';
import 'package:app/pages/inquire/inquire_view.dart';
import 'package:app/pages/item_list/item_list_view.dart';
import 'package:app/pages/login/login_view.dart';
import 'package:app/pages/order/order_view.dart';
import 'package:app/pages/pending_orders/pending_orders_view.dart';
import 'package:app/pages/register/register_view.dart';
import 'package:auto_route/auto_route.dart';

/// Need to run the following command
///    flutter packages pub run build_runner watch

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    MaterialRoute(page: LoginView, initial: true),
    MaterialRoute(page: ItemListView, path: '/item_list'),
    MaterialRoute(page: SignUpView, path: '/signUp'),
    MaterialRoute(page: BottomNavView, path: '/nav'),
    MaterialRoute(page: OrderView, path: '/order'),
    MaterialRoute(page: PendingOrdersView, path: '/pending_orders'),
    MaterialRoute(page: InquireView, path: '/inquire_rejected_orders'),
  ],
)
class $AppRouter {}
