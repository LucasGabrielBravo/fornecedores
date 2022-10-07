import 'package:flutter/material.dart';
import 'package:fornecedores/models/fornecedor.dart';
import 'package:fornecedores/screens/home/form_fornecedor/form_fornecedor_controller.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormFornecedorPage extends GetView<FormFornecedorController> {
  final Fornecedor? fornecedor;

  FormFornecedorPage({super.key, this.fornecedor}) {
    if (fornecedor != null) {
      controller.form.patchValue({
        'matricula': fornecedor!.matricula,
        'nome': fornecedor!.nome,
        'estado': fornecedor!.estado,
        'cidade': fornecedor!.cidade,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((fornecedor == null) ? 'Cadastro de fornecedor' : 'Editar fornecedor'),
        actions: [
          if (fornecedor != null)
            IconButton(
              onPressed: () {
                //Modal para perguntar se deseja excluir o fornecedor
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Excluir fornecedor'),
                      content: const Text('Deseja realmente excluir este fornecedor?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Não'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.deleteFornecedor();
                            Get.back();
                          },
                          child: const Text('Sim'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
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
                    readOnly: (fornecedor != null),
                    decoration: const InputDecoration(
                      labelText: 'Matrícula',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => controller.form.focus('nome'),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  ReactiveTextField(
                    formControlName: 'nome',
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => controller.form.focus('estado'),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  ReactiveTextField(
                    formControlName: 'estado',
                    decoration: const InputDecoration(
                      labelText: 'Estado',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => controller.form.focus('cidade'),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  ReactiveTextField(
                    formControlName: 'cidade',
                    decoration: const InputDecoration(
                      labelText: 'Cidade',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => controller.onSubmit(),
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 16),
                  MaterialButton(
                    color: Get.theme.primaryColor,
                    onPressed: controller.onSubmit,
                    child: Text((fornecedor == null) ? 'Cadastrar' : 'Editar', style: const TextStyle(color: Colors.white)),
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
