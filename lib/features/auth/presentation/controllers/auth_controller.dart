import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vend_gaming/features/auth/domain/adapters/repository_adapter.dart';
import 'package:vend_gaming/features/auth/domain/entities/user.dart';

class AuthController extends GetxController {
  AuthController({required this.authRepository});

  final IAuthRepository authRepository;

  var prefs = GetStorage();
  final refreshToken = ''.obs;
  final user = User().obs;

  bool get isUserLoggedIn => refreshToken.value.isNotEmpty;

  final _loading = false.obs;

  bool get loading => _loading.value;

  @override
  void onInit() {
    initUser();
    super.onInit();
  }

  void initUser() {
    if (prefs.read("refresh_token") != null)
      refreshToken.value = prefs.read("refresh_token");

    if (prefs.read("user") != null)
      user.value = User.fromJson(json.decode(prefs.read("user")));
  }

  void signIn() async {
    _loading.value = true;
    await authRepository.signIn().then((response) {
      _loading.value = false;

      user.value = response;
      refreshToken.value = response.refreshToken ?? '';

      prefs.write("refresh_token", response.idToken);
      prefs.write("user", json.encode(response.toJson()));

      // Get.offAllNamed(Routes.SPLASH);
    }, onError: (e) {
      _loading.value = false;
      print(e);
      Get.snackbar(
        "Logovanje nije uspelo",
        'Proverite email i passoword',
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  void signOut() {
    prefs.write("refresh_token", "");
    refreshToken.value = "";
  }
}
