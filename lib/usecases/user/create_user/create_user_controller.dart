import 'package:fornecedores/usecases/user/create_user/create_user_dto.dart';
import 'package:fornecedores/usecases/user/create_user/create_user_usecase.dart';
import 'package:get/get.dart';

class CreateUserController extends GetxController {
  final CreateUserUseCase _createUserUseCase;

  CreateUserController(this._createUserUseCase);

  Future<void> handle({
    required String name,
    required String login,
    required String password,
  }) async {
    final data = CreateUserDTO(name, login, password);
    final result = await _createUserUseCase.execute(data);

    if (result != null) {
      Get.snackbar('Erro', result.toString());
    } else {
      Get.snackbar('Sucesso', 'Usuário criado com sucesso');      
    }
  }
}
