import 'package:vend_gaming/features/auth/data/auth_api_provider.dart';
import 'package:vend_gaming/features/auth/domain/adapters/repository_adapter.dart';
import 'package:vend_gaming/features/auth/domain/entities/user.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository({required this.provider});

  final IAuthProvider provider;

  @override
  Future<User> signIn() async {
    try {
      return await provider.signIn();
    } catch (e) {
      throw e;
    }
  }
}
