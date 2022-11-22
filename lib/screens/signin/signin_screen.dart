import 'package:flutter/material.dart';
import 'package:fornecedores/screens/signin/signin_controller.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: Get.context!.height * 0.08),
                const Text(
                  'Cadastro de fornecedores',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Informe o login e senha para continuar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ReactiveFormConfig(
                  validationMessages: {
                    ValidationMessage.required: (error) => 'Campo obrigatório',
                    ValidationMessage.minLength: (error) => 'Mínimo de 6 caracteres',
                  },
                  child: ReactiveForm(
                    formGroup: controller.form,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 72,
                              child: ReactiveTextField(
                                formControlName: 'login',
                                decoration: const InputDecoration(
                                  labelText: 'Login',
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            SizedBox(
                              height: 72,
                              child: ReactiveTextField(
                                formControlName: 'password',
                                decoration: const InputDecoration(
                                  labelText: 'Senha',
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                              ),
                            ),
                            MaterialButton(
                              color: Get.theme.primaryColor,
                              onPressed: controller.onSubmit,
                              splashColor: Get.theme.primaryColorDark,
                              child: const Text('Entrar', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
