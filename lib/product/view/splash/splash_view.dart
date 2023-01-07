import 'package:flutter/material.dart';
import 'package:flutter_system/core/extension/image_extension.dart';
import 'package:flutter_system/core/utils/screen_size.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 200,
          backgroundColor: Colors.white54,
          child: Lottie.asset(
            ImageExtension("gate_animation_lottie").toJSON,
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
