import 'package:flutter/material.dart';
import 'package:flutter_system/core/extension/image_extension.dart';
import 'package:flutter_system/core/utils/screen_size.dart';
import 'package:flutter_system/product/routes/app_router.gr.dart';
import 'package:flutter_system/product/routes/route.dart';
import 'package:flutter_system/product/view/menu/home_menu_view.dart';
import 'package:flutter_system/product/view_model/splash/splash_view_model.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final viewModel = SplashViewModel();

  @override
  void initState() {
    debugPrint("Splash Screen Has been called.");
    Future.delayed(const Duration(seconds: 3), () {
      NavRoute(const HomeMenuRoute()).toPush(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 200,
          backgroundColor: Colors.white54,
          child: Lottie.asset(
            ImageExtension(viewModel.lottie_name_path).toJSON,
            reverse: true,
            repeat: true,
            height: DefaultResponsiveSizes(context).kDefaultHeight,
            width: DefaultResponsiveSizes(context).kDefaultWidth,
          ),
        ),
      ),
    );
  }
}
