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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../view/auth/login_view.dart' as _i4;
import '../view/auth/register_view.dart' as _i5;
import '../view/menu/home_menu_view.dart' as _i3;
import '../view/splash/splash_view.dart' as _i2;
import '../view_model/auth/auth_checker.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginAuthChecker.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginAuthChecker(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SplashView(),
      );
    },
    HomeMenuRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomeMenuView(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPageView(),
      );
    },
    RegisterPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterPageView(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/auth_check',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          LoginAuthChecker.name,
          path: '/auth_check',
        ),
        _i6.RouteConfig(
          SplashRoute.name,
          path: '/splash_page',
        ),
        _i6.RouteConfig(
          HomeMenuRoute.name,
          path: '/menu_page',
        ),
        _i6.RouteConfig(
          LoginPageRoute.name,
          path: '/login_page',
        ),
        _i6.RouteConfig(
          RegisterPageRoute.name,
          path: 'reister_page',
        ),
      ];
}

/// generated route for
/// [_i1.LoginAuthChecker]
class LoginAuthChecker extends _i6.PageRouteInfo<void> {
  const LoginAuthChecker()
      : super(
          LoginAuthChecker.name,
          path: '/auth_check',
        );

  static const String name = 'LoginAuthChecker';
}

/// generated route for
/// [_i2.SplashView]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash_page',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i3.HomeMenuView]
class HomeMenuRoute extends _i6.PageRouteInfo<void> {
  const HomeMenuRoute()
      : super(
          HomeMenuRoute.name,
          path: '/menu_page',
        );

  static const String name = 'HomeMenuRoute';
}

/// generated route for
/// [_i4.LoginPageView]
class LoginPageRoute extends _i6.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: '/login_page',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i5.RegisterPageView]
class RegisterPageRoute extends _i6.PageRouteInfo<void> {
  const RegisterPageRoute()
      : super(
          RegisterPageRoute.name,
          path: 'reister_page',
        );

  static const String name = 'RegisterPageRoute';
}
