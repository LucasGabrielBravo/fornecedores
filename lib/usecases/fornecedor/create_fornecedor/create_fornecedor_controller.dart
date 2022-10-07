import 'package:fornecedores/usecases/fornecedor/create_fornecedor/create_fornecedor_dto.dart';
import 'package:fornecedores/usecases/fornecedor/create_fornecedor/create_fornecedor_usecase.dart';

class CreateFornecedorController {
  final CreateFornecedorUseCase _createFornecedorUseCase;

  CreateFornecedorController(this._createFornecedorUseCase);

  Future<Exception?> handle({
    required String matricula,
    required String nome,
    required String cidade,
    required String estado,
  }) async {
    final result = await _createFornecedorUseCase.execute(
      CreateFornecedorDTO(
        matricula: matricula,
        nome: nome,
        cidade: cidade,
        estado: estado,
      ),
    );

    if(result is Exception) {
      return result;
    }

    return null;
  }
}