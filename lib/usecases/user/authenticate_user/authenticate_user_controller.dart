import 'package:fornecedores/main_controller.dart';
import 'package:fornecedores/usecases/user/authenticate_user/authenticate_user_dto.dart';
import 'package:fornecedores/usecases/user/authenticate_user/authenticate_user_usecase.dart';
import 'package:get/get.dart';

class AuthenticateUserController extends GetxController {
  final AuthenticateUserUseCase _authenticateUserUseCase;

  AuthenticateUserController(this._authenticateUserUseCase);

  Future<bool> handle({
    required String login,
    required String password,
  }) async {
    final data = AuthenticateUserDTO(login: login, password: password);
    final result = await _authenticateUserUseCase.execute(data);

    if (result == null) {      
      return false;
    }

    MainController.to.user = result;

    return true;
  }
}
