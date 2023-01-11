import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_system/core/constants/app_constants.dart';
import 'package:flutter_system/core/init/lang/language_manager.dart';
import 'package:flutter_system/core/init/provider/theme_notifier.dart';
import 'firebase_options.dart';
import 'product/routes/app_router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(EasyLocalization(
    supportedLocales: LanguageManager.instance.supportedLocals,
    path: ApplicationConstants.LANG_ASSET_PATH,
    child: ProviderScope(child: MyApp()),
  ));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(themeProvider);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: appThemeState.currentTheme.backgroundColor));
    return MaterialApp.router(
      theme: appThemeState.currentTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
