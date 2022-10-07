import 'package:fornecedores/models/user.dart';
import 'package:fornecedores/repositories/user_repository.dart';
import 'package:fornecedores/usecases/user/create_user/create_user_dto.dart';

class CreateUserUseCase {
  final UserRepository _userRepository;

  CreateUserUseCase(this._userRepository);
  
  Future<Exception?> execute(CreateUserDTO data) async {
    try {
      await _userRepository.create(User(name: data.name, login: data.login), data.password);      
      return null;
    } catch (e) {
      return Exception('Erro ao criar usuário');
    }
  }
}