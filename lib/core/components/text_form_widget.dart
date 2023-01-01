import 'package:flutter/material.dart';
import 'package:flutter_system/core/utils/colors.dart';

import '../utils/screen_size.dart';

class TextForm extends StatelessWidget {
  final String userName;
  final TextEditingController controller;
  final bool? hide;

  const TextForm({
    super.key,
    this.hide,
    required this.userName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DefaultResponsiveSizes(context).kDefaultWidth,
      height: DefaultResponsiveSizes(context).kTextFormFieldHeight,
      child: TextFormField(
        obscureText: hide ?? false,
        controller: controller,
        style: Theme.of(context).textTheme.titleSmall,
        showCursor: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: const EdgeInsets.all(20),
            labelText: userName,
            labelStyle: Theme.of(context).textTheme.titleSmall,
            fillColor: UIColor().textFormColor),
      ),
    );
  }
}
