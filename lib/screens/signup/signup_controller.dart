import 'package:fornecedores/usecases/user/user_usecases.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignupController extends GetxController {
  final FormGroup form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required, Validators.minLength(3)]),
    'login': FormControl<String>(validators: [Validators.required, Validators.minLength(6)]),
    'password': FormControl<String>(validators: [Validators.required, Validators.minLength(6)]),
    'confPassword': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6),
    ]),
  }, validators: [
    Validators.mustMatch('password', 'confPassword'),
  ]);

  Future<void> onSubmit() async {
    if (form.valid) {
      await UserUseCases.createUserController.handle(
        name: form.control('name').value.toString().trim(),
        login: form.control('login').value.toString().trim(),
        password: form.control('password').value.toString().trim(),
      );

      Get.offNamed('/');
    } else {
      Get.snackbar('Erro', 'Formulário inválido');
    }
  }
}
