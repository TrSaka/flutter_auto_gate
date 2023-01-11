import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeMenuView extends StatefulWidget {
  const HomeMenuView({super.key});

  @override
  State<HomeMenuView> createState() => _HomeMenuViewState();
}

class _HomeMenuViewState extends State<HomeMenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text("Sign Out"),
        ),
      ),
    );
  }
}
