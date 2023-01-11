// ignore_for_file: non_constant_identifier_names
import 'dart:async';
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

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //Remember Me CheckBox Button
  StreamController checkBoxState = StreamController.broadcast();
  Stream get checkBoxStream => checkBoxState.stream.asBroadcastStream();
  bool rememberMe = false;
  //Remember Me CheckBox Button

  //Strings for UI
  String get login_text => LocaleKeys.loginText.locale;
  String get user_name_text => LocaleKeys.userName.locale;
  String get textForm_password_text => LocaleKeys.textFormFieldPasswordText;
  String get password_text => LocaleKeys.passwordText.locale;
  String get forgotPasswordText => LocaleKeys.forgotPasswordText.locale;
  String get resetPasswordText => LocaleKeys.resetPasswordText.locale;
  String get login_button_text => LocaleKeys.loginButtonText.locale;
  String get email_text => LocaleKeys.emailText.locale;
  String get remember_me => LocaleKeys.rememberMe.locale;
  //Strings for UI
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
