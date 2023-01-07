import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_system/core/utils/colors.dart';
import 'package:flutter_system/core/utils/screen_size.dart';
import 'package:flutter_system/product/routes/app_router.gr.dart';
import 'package:flutter_system/product/routes/route.dart';
import 'package:flutter_system/product/view_model/auth/login_state.dart';
import 'package:flutter_system/product/view_model/auth/login_view_model.dart';
import '../../../core/components/app_avatar_widget.dart';
import '../../../core/components/login_register_button_widget.dart';
import '../../../core/components/text_form_widget.dart';

class LoginPageView extends ConsumerStatefulWidget {
  const LoginPageView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends ConsumerState<LoginPageView> {
  @override
  void initState() {
    viewModel.checkBoxState; //Stream Controller
    viewModel.checkBoxStream; //Stream
    viewModel.checkBoxStream.listen((event) {
      viewModel.rememberMe = event;
    });
    super.initState();
  }

  @override
  void dispose() {
    viewModel.checkBoxState.close();
    super.dispose();
  }

  LoginViewModel viewModel = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    // You can not use this field in viewModel , avoid of bad state in Riverpod !
    ref.listen<LoginState>(viewModel.loginControllerProvider,
        (((previous, next) {
      if (next is LoginStateSuccess) {
        NavRoute(const SplashRoute()).toPush(context);
        debugPrint("Completed !");
      }
      if (next is LoginStateLoading) {
        debugPrint("Loading...");
      }
      if (next is LoginStateError) {
        debugPrint("Error $next");
      }
    })));

    //
    //
    return Scaffold(
        backgroundColor: UIColor().backgroundColor,
        appBar: AppBar(
          backgroundColor: UIColor().backgroundColor,
          title: const AppAvatar(),
          toolbarHeight: DefaultResponsiveSizes(context).authAppBarSize,
          elevation: Theme.of(context).appBarTheme.elevation,
          centerTitle: Theme.of(context).appBarTheme.centerTitle,
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DefaultResponsiveSizes(context).kHorizontal),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height:
                      DefaultResponsiveSizes(context).kDefaultNormalHeight / 3,
                ),
                Row(
                  children: [
                    Text(viewModel.login_text,
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                SizedBox(
                    height:
                        DefaultResponsiveSizes(context).kDefaultSmallHeight /
                            1),
                TextForm(
                  userName: viewModel.email_text,
                  controller: viewModel.emailController,
                ),
                SizedBox(
                    height: DefaultResponsiveSizes(context)
                            .kSpaceBetweenFormFields /
                        1.5),
                TextForm(
                  userName: viewModel.textForm_password_text,
                  controller: viewModel.passwordController,
                  hide: true,
                ),
                SizedBox(
                    height: DefaultResponsiveSizes(context)
                            .kSpaceBetweenFormFields /
                        5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StreamBuilder(
                      stream: viewModel.checkBoxStream,
                      initialData: false,
                      builder: ((context, AsyncSnapshot snapshot) {
                        return Checkbox(
                            value: viewModel.rememberMe,
                            onChanged: (changedValue) {
                              viewModel.checkBoxState.sink.add(changedValue);
                            });
                      }),
                    ),
                    Text(viewModel.remember_me),
                  ],
                ),
                LoginRegisterButton(
                    text: viewModel.login_text,
                    event: () => ref
                        .read(viewModel.loginControllerProvider.notifier)
                        .login(
                          viewModel.emailController.text,
                          viewModel.passwordController.text,
                          viewModel.rememberMe,
                        )),
                AuthSubtitle(
                  firstText: viewModel.forgotPasswordText,
                  secondText: viewModel.resetPasswordText,
                  route: const RegisterPageRoute(),
                ),
              ],
            ),
          ),
        ));
  }
}
