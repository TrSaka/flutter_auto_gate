// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_system/core/init/lang/locale_keys.g.dart';
import 'package:flutter_system/core/extension/string_extension.dart';
import '../../../core/init/provider/auth_provider.dart';
import 'login_state.dart';

class LoginViewModel {
  final loginControllerProvider =
      StateNotifierProvider<LoginController, LoginState>((ref) {
    return LoginController(ref);
  });

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  String login_text = LocaleKeys.loginText.locale;
  String user_name_text = LocaleKeys.userName.locale;
  String textForm_password_text = LocaleKeys.textFormFieldPasswordText;
  String password_text = LocaleKeys.passwordText.locale;
  String forgotPasswordText = LocaleKeys.forgotPasswordText;
  String resetPasswordText = LocaleKeys.resetPasswordText;
  String login_button_text = LocaleKeys.loginButtonText;
}

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  void login(String email, String password, bool rememberMe) async {
    state = const LoginStateLoading();
    try {
      await ref.read(authProvider).login(
            email,
            password,
            rememberMe,
          );
      state = const LoginStateSuccess();
    } on FirebaseException catch (e) {
      state = LoginStateError(e.toString());
    }
  }
}
