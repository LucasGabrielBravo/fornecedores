import 'package:fornecedores/screens/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController());
  }
}