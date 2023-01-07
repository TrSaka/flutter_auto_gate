// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_system/core/init/lang/locale_keys.g.dart';
import 'package:flutter_system/core/extension/string_extension.dart';
import 'package:flutter_system/product/view_model/auth/Register_state.dart';
import '../../../core/init/provider/auth_provider.dart';

class RegisterViewModel {
  final registerControllerProvider =
      StateNotifierProvider<RegisterController, RegisterState>((ref) {
    return RegisterController(ref);
  });

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String register_text = LocaleKeys.registerText.locale;
  String login_text = LocaleKeys.loginText.locale;
  String user_name_text = LocaleKeys.userName.locale;
  String textForm_password_text = LocaleKeys.textFormFieldPasswordText;
  String password_text = LocaleKeys.passwordText.locale;
  String already_have_account_text = LocaleKeys.alreadyHaveAnAccount;
  String resetPasswordText = LocaleKeys.resetPasswordText;
  String login_button_text = LocaleKeys.loginButtonText;
  String name_text = LocaleKeys.nameText;
  String email_text = LocaleKeys.emailText;
}

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController(this.ref) : super(const RegisterStateInitial());

  final Ref ref;

  void register(String name, String email, String password) async {
    state = const RegisterStateLoading();
    try {
      await ref.read(authProvider).register(
            name,
            email,
            password,
          );
      state = const RegisterStateSuccess();
    } on FirebaseException catch (e) {
      state = RegisterStateError(e.toString());
    }
  }
}
