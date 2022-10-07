import 'package:fornecedores/models/fornecedor.dart';
import 'package:fornecedores/usecases/fornecedor/fornecedor_usecases.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HomeController extends GetxController {
  FormControl<String> searchControl = FormControl<String>(value: '');
  List<Fornecedor> _fornecedores = [];

  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  List<Fornecedor> get fornecedores => _fornecedores;
  set fornecedores(List<Fornecedor> value) {
    _fornecedores = value;
    update();
  }


  Future<void> loadFornecedores() async {
    isLoading = true;
    
    fornecedores = await FornecedorUseCases.readAllFornecedorController.handle();

    isLoading = false;
  }
  
  @override
  void onInit() {
    super.onInit();
    loadFornecedores();
  }
}