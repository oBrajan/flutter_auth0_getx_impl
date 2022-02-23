import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vend_gaming/bindings/auth_binding.dart';
import 'package:vend_gaming/features/auth/presentation/auth_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: AuthBinding(),
    ),
    // GetPage(
    //   name: Routes.HOME,
    //   page: () => ShopScreen(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: Routes.LOGIN,
    //   page: () => LoginPage(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: Routes.DETAILS,
    //   page: () => ArticleDetailsScreen(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: Routes.DETAILS_FULLSCREEN,
    //   page: () => ArticleDetailsFullscreenImage(),
    //   binding: HomeBinding(),
    // ),
  ];
}
