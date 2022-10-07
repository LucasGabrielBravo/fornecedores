import 'package:flutter/material.dart';
import 'package:fornecedores/screens/initial/initial_controller.dart';
import 'package:get/get.dart';

class InitialScreen extends GetView<InitialController> {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Get.theme.primaryColor,
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),          
          ),
        ),
      ),
    );
  }
}
