import 'package:flutter/material.dart';
import 'package:flutter_system/core/extension/image_extension.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white70,
      radius: 50,
      child: Image(image: AssetImage(ImageExtension("app-logo").toPng)),
    );
  }
}
