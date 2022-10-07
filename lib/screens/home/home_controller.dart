import 'package:fornecedores/models/fornecedor.dart';
import 'package:fornecedores/usecases/fornecedor/fornecedor_usecases.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HomeController extends GetxController {
  FormControl<String> searchControl = FormControl<String>(value: '');
  List<Fornecedor> _fornecedores = [];

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  List<Fornecedor> get fornecedores => _fornecedores;
  set fornecedores(List<Fornecedor> value) {
    _fornecedores = value;
    update();
  }

  Future<void> loadFornecedores() async {
    fornecedores = await FornecedorUseCases.readAllFornecedorController.handle();
  }

  Future<void> _init() async {
    searchControl.valueChanges.listen((event) => update());

    isLoading = true;
    await loadFornecedores();
    isLoading = false;
  }

  static HomeController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  @override
  void onClose() {
    searchControl.dispose();
    super.onClose();
  }
}
