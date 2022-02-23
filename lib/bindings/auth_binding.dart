import 'package:get/get.dart';
import 'package:vend_gaming/features/auth/data/auth_api_provider.dart';
import 'package:vend_gaming/features/auth/data/auth_repository.dart';
import 'package:vend_gaming/features/auth/domain/adapters/repository_adapter.dart';
import 'package:vend_gaming/features/auth/presentation/controllers/auth_controller.dart';
import 'package:vend_gaming/network/http_manager.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHttpManager>(() => HttpManager());

    // Providers
    Get.lazyPut<IAuthProvider>(() => AuthProvider());

    // Repositories
    Get.lazyPut<IAuthRepository>(() => AuthRepository(provider: Get.find()));

    // Controllers
    Get.lazyPut(() => AuthController(authRepository: Get.find()));
  }
}
