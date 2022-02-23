import 'dart:convert';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vend_gaming/features/auth/domain/entities/user.dart';
import 'package:vend_gaming/shared/constants.dart';
import 'package:http/http.dart' as http;

abstract class IAuthProvider {
  Future<User> signIn();
}

class AuthProvider implements IAuthProvider {
  final FlutterAppAuth appAuth = FlutterAppAuth();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  Future<User> signIn() async {
    try {
      final AuthorizationTokenResponse? result =
          await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          Constants.AUTH0_CLIENT_ID,
          Constants.AUTH0_REDIRECT_URI,
          issuer: 'https://${Constants.AUTH0_DOMAIN}',
          scopes: ['openid', 'profile', 'offline_access'],
          // promptValues: ['login']
        ),
      );

      final idToken = parseIdToken(result!.idToken);
      final profile = await getUserDetails(result.accessToken);

      await secureStorage.write(
          key: 'refresh_token', value: result.refreshToken);

      return User(
        accessToken: result.accessToken,
        refreshToken: result.refreshToken,
        idToken: result.idToken,
        email: idToken!['email'],
        name: idToken['name'],
        nickname: idToken['nickname'],
        picture: profile['picture'],
      );
    } catch (e, s) {
      print('login error: $e - stack: $s');
      throw e;
    }
  }

  Map<String, dynamic>? parseIdToken(String? idToken) {
    final parts = idToken!.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }

  Future<Map<String, dynamic>> getUserDetails(String? accessToken) async {
    final url = Uri.parse('https://${Constants.AUTH0_DOMAIN}/userinfo');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }
}
