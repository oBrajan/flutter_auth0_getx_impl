import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:vend_gaming/bindings/auth_binding.dart';
import 'package:vend_gaming/routes/app_pages.dart';
import 'package:vend_gaming/shared/constants.dart';
import 'package:vend_gaming/shared/logger_utils.dart';

import 'features/auth/presentation/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(VendgamingApp());
}

class VendgamingApp extends StatelessWidget {
  const VendgamingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      enableLog: true,
      logWriterCallback: Logger.write,
      home: SplashScreen(),
      defaultTransition: Transition.rightToLeftWithFade,
      getPages: AppPages.routes,
      theme: Themes.dark,
    );
  }
}

class Themes {
  static final light = ThemeData.light().copyWith(
    accentColor: Colors.white,
    primaryColor: AppColors.black,
    primaryColorLight: AppColors.white,
    focusColor: AppColors.black,
    bottomSheetTheme:
    BottomSheetThemeData(backgroundColor: Colors.white.withOpacity(0.7)),
  );
  static final dark = ThemeData.dark().copyWith(
    accentColor: Colors.white,
    primaryColor: AppColors.black,
    primaryColorLight: AppColors.white,
    focusColor: AppColors.black,
    bottomSheetTheme:
    BottomSheetThemeData(backgroundColor: Colors.white.withOpacity(0.7)),
  );
}
