import 'package:flutter/material.dart';
import 'package:fornecedores/main_bindings.dart';
import 'package:fornecedores/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fornecedores',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialBinding: MainBindings(),
      getPages: AppPages.pages,
    );
  }
}
