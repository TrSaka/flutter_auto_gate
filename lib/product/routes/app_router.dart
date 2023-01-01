import 'package:auto_route/auto_route.dart';
import 'package:flutter_system/product/view/auth/login_view.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_system/product/view_model/auth/auth_checker.dart';
import '../view/auth/register_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: AuthChecker, initial: true, path: "/auth_check"),
    AutoRoute(page: LoginPageView, initial: false, path: "/login_page"),
    AutoRoute(page: RegisterPageView, initial: false, path: 'reister_page'),
  ],
)
// extend the generated private router
class $AppRouter {}
