import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vend_gaming/features/auth/presentation/controllers/auth_controller.dart';

class Login extends GetWidget<AuthController> {

  const Login();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            // loginAction();

            controller.signIn();
          },
          child: Text('Login'),
        ),
      ],
    );
  }
}
