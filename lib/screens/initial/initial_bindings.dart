import 'package:fornecedores/screens/initial/initial_controller.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<InitialController>(InitialController());
  }
}
