import 'package:flutter/material.dart';

class Constants {
  static const AUTH0_DOMAIN = ''; // TODO: e.g. dev-wb000-p9.eu.auth0.com
  static const AUTH0_CLIENT_ID = '';  // TODO: e.g. IKbasdfS7BnLJuDdX9aHwS0Nv9WYw589
  static const AUTH0_REDIRECT_URI = ''; // TODO: e.g. com.example.example://login-callback
}

class AppColors {
  // Light theme
  static const Color primary_color_light = Color.fromRGBO(75, 75, 75, 1);
  static const Color accent_color_light = Color.fromRGBO(40, 97, 235, 1);
  static const Color background_grey = Color.fromRGBO(239, 239, 243, 1);
  static const Color black = Color.fromRGBO(23, 30, 33, 1);
  static const Color white = Colors.white;

  // static const Color mainIconColor = Color.fromRGBO(0, 204, 0, 1);
  static const Color Yellow = Color.fromRGBO(230, 200, 0, 1);

  // Dark theme
  static Color primaryColorDark = Color.fromRGBO(23, 30, 33, 1);
  static const Color accent_color_dark = Colors.deepPurpleAccent;
}
