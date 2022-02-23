import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vend_gaming/features/auth/presentation/controllers/auth_controller.dart';

class Profile extends GetWidget<AuthController> {
  final String? name;
  final String? picture;

  Profile(this.name, this.picture);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 4.0),
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(picture ?? ''),
            ),
          ),
        ),
        SizedBox(height: 24.0),
        Text('Name: $name'),
        SizedBox(height: 48.0),
        RaisedButton(
          onPressed: () {
            controller.signOut();
          },
          child: Text('Logout'),
        ),
      ],
    );
  }
}
