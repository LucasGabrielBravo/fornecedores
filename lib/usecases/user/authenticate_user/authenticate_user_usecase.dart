import 'package:fornecedores/models/user.dart';
import 'package:fornecedores/repositories/user_repository.dart';
import 'package:fornecedores/usecases/user/authenticate_user/authenticate_user_dto.dart';

class AuthenticateUserUseCase {
  final UserRepository _userRepository;

  AuthenticateUserUseCase(this._userRepository);

  Future<User?> execute(AuthenticateUserDTO data) async {
    return await _userRepository.readOneWithPassword(data.login, data.password);    
  }
}