import 'package:fornecedores/repositories/user_repository.dart';
import 'package:fornecedores/routes/app_routes.dart';
import 'package:get/get.dart';

class InitialController extends GetxController {
  Future<void> verifyUser() async {
    final usuarios = await UserRepository().readAll();

    await Future.delayed(const Duration(seconds: 1));

    if (usuarios.isEmpty) {
      Get.offNamed(Routes.signUp);
    } else {
      Get.offNamed(Routes.signIn);
    }
  }

  @override
  void onInit() {
    super.onInit();

    verifyUser();
  }
}
