import 'package:fornecedores/repositories/user_repository.dart';
import 'package:fornecedores/usecases/user/authenticate_user/authenticate_user_controller.dart';
import 'package:fornecedores/usecases/user/authenticate_user/authenticate_user_usecase.dart';
import 'package:fornecedores/usecases/user/create_user/create_user_controller.dart';
import 'package:fornecedores/usecases/user/create_user/create_user_usecase.dart';

class UserUseCases {
  static final UserRepository _userRepository = UserRepository();

  static CreateUserUseCase get createUserUseCase => CreateUserUseCase(_userRepository);
  static CreateUserController get createUserController => CreateUserController(createUserUseCase);

  static AuthenticateUserUseCase get authenticateUserUseCase => AuthenticateUserUseCase(_userRepository);
  static AuthenticateUserController get authenticateUserController => AuthenticateUserController(authenticateUserUseCase);
}