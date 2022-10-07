import 'package:fornecedores/main_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}