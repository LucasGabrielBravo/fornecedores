import 'package:fornecedores/screens/home/home_controller.dart';
import 'package:fornecedores/usecases/fornecedor/fornecedor_usecases.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormFornecedorController extends GetxController {
  final FormGroup form = FormGroup({
    'matricula': FormControl<String>(validators: [Validators.required, Validators.minLength(6)], value: DateFormat('yyyyMMddHHmmss').format(DateTime.now())),
    //'matricula': FormControl<String>(validators: [Validators.required, Validators.minLength(6)]),
    'nome': FormControl<String>(validators: [Validators.required, Validators.minLength(4)]),
    'estado': FormControl<String>(validators: [Validators.required, Validators.minLength(2)]),
    'cidade': FormControl<String>(validators: [Validators.required, Validators.minLength(2)]),
  });

  Future<void> onSubmit() async {
    if (form.valid) {
      await FornecedorUseCases.createFornecedorController.handle(
        matricula: form.control('matricula').value.toString().trim(),
        nome: form.control('nome').value.toString().trim(),
        cidade: form.control('estado').value.toString().trim(),
        estado: form.control('cidade').value.toString().trim(),
      );

      HomeController.to.loadFornecedores();

      Get.back();
      Get.rawSnackbar(
        title: 'Sucesso',
        message: 'Fornecedor cadastrado',
      );
    } else {
      Get.rawSnackbar(
        title: 'Erro',
        message: 'Formulário inválido',
      );
    }
  }

  Future<void> deleteFornecedor() async {
    if (form.control('matricula').valid) {
      await FornecedorUseCases.deleteFornecedorController.handle(
        matricula: form.control('matricula').value.toString().trim(),
      );

      HomeController.to.loadFornecedores();

      Get.back();
      Get.rawSnackbar(
        title: 'Sucesso',
        message: 'Fornecedor excluído',
      );
    } else {
      Get.rawSnackbar(
        title: 'Erro',
        message: 'Matricula inválida',
      );
    }
  }
}
