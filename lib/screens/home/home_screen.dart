import 'package:flutter/material.dart';
import 'package:fornecedores/screens/home/form_fornecedor/form_fornecedor_bindings.dart';
import 'package:fornecedores/screens/home/form_fornecedor/form_fornecedor_screen.dart';
import 'package:fornecedores/screens/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              ReactiveTextField(
                formControl: controller.searchControl,
                decoration: const InputDecoration(
                  labelText: 'Pesquisar',
                  border: OutlineInputBorder(),
                  isDense: true,
                  fillColor: Color.fromARGB(255, 240, 240, 240),
                  filled: true,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16),
              GetBuilder<HomeController>(
                builder: ((controller) {
                  if (controller.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.fornecedores.isEmpty) {
                    return const Center(child: Text('Nenhum fornecedor encontrado'));
                  }

                  final fornecedores = controller.fornecedores.where((element) {
                    final search = controller.searchControl.value!.toLowerCase();

                    bool test = search.isEmpty;
                    test = test || element.matricula.toLowerCase().contains(search);
                    test = test || element.nome.toLowerCase().contains(search);
                    test = test || element.estado.toLowerCase().contains(search);
                    test = test || element.cidade.toLowerCase().contains(search);

                    return test;
                  }).toList();

                  return Expanded(
                    child: ListView.builder(
                      itemCount: fornecedores.length,
                      itemBuilder: (context, index) {
                        final fornecedor = fornecedores[index];

                        return Card(
                          child: ListTile(
                            title: Text(fornecedor.nome),
                            subtitle: Text('${fornecedor.cidade}, ${fornecedor.estado}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Get.to(() => FormFornecedorPage(fornecedor: fornecedor), binding: FormFornecedorBindings());
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => FormFornecedorPage(), binding: FormFornecedorBindings());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
