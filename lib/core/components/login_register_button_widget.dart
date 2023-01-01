import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_system/product/routes/route.dart';
import '../utils/screen_size.dart';

class LoginRegisterButton extends StatelessWidget {
  const LoginRegisterButton({
    Key? key,
    required this.text,
    required this.event,
  }) : super(key: key);
  final String text;
  final Function event;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: MaterialButton(
        onPressed: () {
          event();
        },
        child: Container(
          height: DefaultResponsiveSizes(context).kTextFormFieldHeight,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
              child: Text(
            text,
            style: Theme.of(context).textTheme.titleLarge,
          )),
        ),
      ),
    );
  }
}

class AuthSubtitle extends StatelessWidget {
  const AuthSubtitle({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.route,
  }) : super(key: key);
  final String firstText;
  final String secondText;
  final PageRouteInfo route;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstText),
        TextButton(
            onPressed: () {
              NavRoute(route).toPushReplecement(context);
            },
            child: Text(secondText)),
      ],
    );
  }
}
