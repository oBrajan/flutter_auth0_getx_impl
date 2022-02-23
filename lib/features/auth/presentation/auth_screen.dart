import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vend_gaming/features/auth/presentation/controllers/auth_controller.dart';

import 'views/Login.dart';
import 'views/Profile.dart';

class SplashScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth0 Demo',
      home: Obx(() {
        return Scaffold(
          appBar: AppBar(
            title: Text('Auth0 Demo'),
          ),
          body: Center(
            child: controller.loading
                ? CircularProgressIndicator()
                : controller.isUserLoggedIn
                    ? Profile(controller.user.value.name,
                        controller.user.value.picture)
                    : Login(),
          ),
        );
      }),
    );
  }
}
