// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_system/core/init/provider/auth_provider.dart';
import 'package:flutter_system/product/view/auth/login_view.dart';
import 'package:flutter_system/product/view/menu/home_menu_view.dart';

class LoginAuthChecker extends ConsumerWidget {
  const LoginAuthChecker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(
        authStateProvider); // auth state provider fetches users activity !
    return _authState.when(
      data: (user) {
        if (user != null) {
          debugPrint("User In !");
          debugPrint("User :${user.email}");
          return const HomeMenuView();
        } else {
          debugPrint("Please let user in");
          return const LoginPageView();
        }
      },
      error: (error, stackTrace) {
        return const Text("err");
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
