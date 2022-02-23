import 'package:vend_gaming/features/auth/domain/entities/user.dart';

abstract class IAuthRepository {
  Future<User> signIn();
}
