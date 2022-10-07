import 'package:fornecedores/screens/signin/signin_controller.dart';
import 'package:get/get.dart';

class SignInBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
