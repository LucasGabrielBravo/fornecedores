import 'package:flutter/material.dart';
import 'package:fornecedores/screens/home/form_fornecedor/form_fornecedor_controller.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormFornecedorPage extends GetView<FormFornecedorController> {
  const FormFornecedorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de fornecedor')),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: ReactiveFormConfig(
            validationMessages: {
              ValidationMessage.required: (error) => 'Campo obrigatório',
              ValidationMessage.minLength: (error) => 'Mínimo de ${(error as Map<String, dynamic>)['requiredLength']} caracteres',
            },
            child: ReactiveForm(
              formGroup: controller.form,
              child: Column(
                children: <Widget>[
                  ReactiveTextField(
                    formControlName: 'matricula',
                    decoration: const InputDecoration(
                      labelText: 'Matrícula',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ReactiveTextField(
                    formControlName: 'nome',
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ReactiveTextField(
                    formControlName: 'estado',
                    decoration: const InputDecoration(
                      labelText: 'Estado',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ReactiveTextField(
                    formControlName: 'cidade',
                    decoration: const InputDecoration(
                      labelText: 'Cidade',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
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
    );
  }
}
