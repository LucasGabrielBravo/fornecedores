import 'package:flutter/material.dart';
import 'package:fornecedores/main_controller.dart';
import 'package:fornecedores/screens/home/form_fornecedor/form_fornecedor_bindings.dart';
import 'package:fornecedores/screens/home/form_fornecedor/form_fornecedor_screen.dart';
import 'package:fornecedores/screens/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usuario = MainController.to.user;

    return Scaffold(
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
                  fillColor: Color.fromARGB(255, 238, 238, 238),
                  filled: true,
                ),
              ),
              (controller.isLoading)
                  ? const Expanded(child: LinearProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                        itemCount: controller.fornecedores.length,
                        itemBuilder: (context, index) {
                          final fornecedor = controller.fornecedores[index];
                          return Card(
                            child: ListTile(
                              title: Text(fornecedor.nome),
                              subtitle: Text(fornecedor.cidade),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => {},
                              ),
                            ),
                          );                        
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const FormFornecedorPage(), binding: FormFornecedorBindings());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
