import 'package:fornecedores/screens/home/form_fornecedor/form_fornecedor_controller.dart';
import 'package:get/get.dart';

class FormFornecedorBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormFornecedorController>(() => FormFornecedorController());
  }
}
