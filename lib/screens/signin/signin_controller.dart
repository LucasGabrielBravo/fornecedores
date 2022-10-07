import 'package:fornecedores/usecases/user/user_usecases.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInController extends GetxController {
  final FormGroup form = FormGroup({
    'login': FormControl<String>(validators: [Validators.required, Validators.minLength(6)], value: 'lgbravo'),
    'password': FormControl<String>(validators: [Validators.required, Validators.minLength(6)], value: '12345678'),
  });

  Future<void> onSubmit() async {
    if (form.valid) {
      final result = await UserUseCases.authenticateUserController.handle(
        login: form.control('login').value.toString().trim(),
        password: form.control('password').value.toString().trim(),
      );

      if (result) {
        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Erro', 'Usuário ou senha inválidos');
      }      
    } else {
      Get.snackbar('Erro', 'Formulário inválido');
    }
  }
}
