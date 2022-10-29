import 'package:app/pages/login/login_view.dart';
import 'package:app/pages/register/register.dart';
import 'package:auto_route/auto_route.dart';

/// Need to run the following command
///    flutter packages pub run build_runner watch


@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    MaterialRoute(page: LoginView, initial: true),
    // MaterialRoute(page: AuthSelectView, path: '/authSelect'),
    // MaterialRoute(page: LoginView, path: '/login'),
    MaterialRoute(page: SignUpView, path: '/signUp'),
    // MaterialRoute(page: AdminHomeView, path: '/admin_home'),
    // MaterialRoute(page: AdminTabControllerView, path: '/admin_tab_controller'),

  ],
)
class $AppRouter {}