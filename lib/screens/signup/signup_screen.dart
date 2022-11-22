import 'package:flutter/material.dart';
import 'package:fornecedores/screens/signup/signup_controller.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignupScreen extends GetWidget<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: Get.context!.height * 0.05),
                const Text(
                  'Crie uma conta para fazer o primeiro acesso',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
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
                                formControlName: 'name',
                                decoration: const InputDecoration(
                                  labelText: 'Nome',
                                ),
                              ),
                            ),
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
                            SizedBox(
                              height: 72,
                              child: ReactiveTextField(
                                formControlName: 'confPassword',
                                decoration: const InputDecoration(
                                  labelText: 'Confirme a senha',
                                ),
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                validationMessages: {
                                  ValidationMessage.mustMatch: (error) => 'As senhas não conferem',
                                },
                              ),
                            ),
                            ElevatedButton(
                              onPressed: controller.onSubmit,
                              child: const Text('Cadastrar'),
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
