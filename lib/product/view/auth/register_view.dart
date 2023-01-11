import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_system/product/view_model/auth/register_view_model.dart';

import '../../../core/components/app_avatar_widget.dart';
import '../../../core/components/login_register_button_widget.dart';
import '../../../core/components/text_form_widget.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/screen_size.dart';
import '../../routes/app_router.gr.dart';
import '../../routes/route.dart';
import '../../view_model/auth/Register_state.dart';

class RegisterPageView extends ConsumerStatefulWidget {
  const RegisterPageView({super.key});

  @override
  ConsumerState<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends ConsumerState<RegisterPageView> {
  RegisterViewModel viewModel = RegisterViewModel();

  Widget build(BuildContext context) {
    ref.listen<RegisterState>(viewModel.registerControllerProvider,
        (((previous, next) {
      if (next is RegisterStateSuccess) {
        NavRoute(const LoginPageRoute()).toPush(context);
        debugPrint("Completed !");
      }
      if (next is RegisterStateLoading) {
        debugPrint("Loading...");
      }
      if (next is RegisterStateError) {
        debugPrint("Error $next");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Please check your email or password.")));
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
                    height:
                        DefaultResponsiveSizes(context).kDefaultHeight / 30),
                Row(
                  children: [
                    Text(viewModel.register_text,
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                SizedBox(
                    height:
                        DefaultResponsiveSizes(context).kDefaultSmallHeight),
                TextForm(
                  userName: viewModel.name_text,
                  controller: viewModel.nameController,
                ),
                SizedBox(
                    height: DefaultResponsiveSizes(context)
                            .kSpaceBetweenFormFields /
                        2),
                TextForm(
                  userName: viewModel.email_text,
                  controller: viewModel.emailController,
                ),
                SizedBox(
                    height: DefaultResponsiveSizes(context)
                            .kSpaceBetweenFormFields /
                        2),
                TextForm(
                  userName: viewModel.textForm_password_text,
                  controller: viewModel.passwordController,
                  hide: true,
                ),
                SizedBox(
                    height: DefaultResponsiveSizes(context)
                        .kSpaceBetweenFormFields),
                LoginRegisterButton(
                    text: viewModel.login_button_text,
                    event: () => ref
                        .read(viewModel.registerControllerProvider.notifier)
                        .register(
                          viewModel.nameController.text,
                          viewModel.emailController.text,
                          viewModel.passwordController.text,
                        )),
                AuthSubtitle(
                  firstText: viewModel.already_have_account_text,
                  secondText: viewModel.login_text,
                  route: const LoginPageRoute(),
                ),
              ],
            ),
          ),
        ));
  }
}
