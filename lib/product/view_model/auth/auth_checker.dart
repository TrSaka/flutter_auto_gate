import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_system/core/init/provider/auth_provider.dart';
import 'package:flutter_system/product/view/auth/login_view.dart';
import 'package:flutter_system/product/view/auth/register_view.dart';

class AuthChecker extends ConsumerWidget {
  @override
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(
        authStateProvider); // auth state provider fetches users activity !
    return _authState.when(
      data: (user) {
        if (user != null) {
          return const RegisterPageView();
        } else {
          return const LoginPageView();
        }
      },
      error: (error, stackTrace) {
        return Text("err");
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
