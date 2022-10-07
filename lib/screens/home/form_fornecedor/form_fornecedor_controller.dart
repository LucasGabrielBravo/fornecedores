import 'package:fornecedores/usecases/fornecedor/fornecedor_usecases.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormFornecedorController extends GetxController {
  final FormGroup form = FormGroup({
    'matricula': FormControl<String>(validators: [Validators.required, Validators.minLength(6)]),
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

      Get.back();
      Get.snackbar('Sucesso', 'Fornecedor cadastrado');
    } else {
      Get.snackbar('Erro', 'Formulário inválido');
    }
  }
}
