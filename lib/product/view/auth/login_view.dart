import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_system/core/utils/colors.dart';
import 'package:flutter_system/core/utils/screen_size.dart';
import 'package:flutter_system/product/routes/app_router.gr.dart';
import 'package:flutter_system/product/routes/route.dart';
import 'package:flutter_system/product/view/auth/register_view.dart';
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
  LoginViewModel viewModel = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(viewModel.loginControllerProvider,
        (((previous, next) {
      if (next is LoginStateSuccess) {
        NavRoute(const RegisterPageRoute()).toPush(context);
        debugPrint("Completed !");
      }
      if (next is LoginStateLoading) {
        debugPrint("Loading...");
      }
      if (next == LoginStateError) {
        debugPrint("Error $next");
        NavRoute(const RegisterPageRoute()).toPush(context);
      }
    })));
    return Scaffold(
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
                  height: DefaultResponsiveSizes(context).kDefaultHeight / 15,
                ),
                Row(
                  children: [
                    Text(viewModel.login_text,
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                SizedBox(
                    height:
                        DefaultResponsiveSizes(context).kDefaultSmallHeight *
                            1.3),
                TextForm(
                  userName: viewModel.user_name_text,
                  controller: viewModel.userNameController,
                ),
                SizedBox(
                    height: DefaultResponsiveSizes(context)
                        .kSpaceBetweenFormFields),
                TextForm(
                  userName: viewModel.textForm_password_text,
                  controller: viewModel.passwordController,
                  hide: true,
                ),
                SizedBox(
                    height: DefaultResponsiveSizes(context)
                        .kSpaceBetweenFormFields),
                LoginRegisterButton(
                    text: viewModel.login_text,
                    event: () => ref
                        .read(viewModel.loginControllerProvider.notifier)
                        .login(viewModel.userNameController.text,
                            viewModel.passwordController.text, false)),
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
