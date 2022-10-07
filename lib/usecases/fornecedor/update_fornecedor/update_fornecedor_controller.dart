import 'package:fornecedores/usecases/fornecedor/update_fornecedor/update_fornecedor_dto.dart';
import 'package:fornecedores/usecases/fornecedor/update_fornecedor/update_fornecedor_usecase.dart';

class UpdateFornecedorController {
  final UpdateFornecedorUseCase _updateFornecedorUseCase;

  UpdateFornecedorController(this._updateFornecedorUseCase);

  Future<String?> handle({
    required String matricula,
    required String nome,
    required String cidade,
    required String estado,
  }) async {
    final result = await _updateFornecedorUseCase.execute(
      UpdateFornecedorDTO(
        matricula: matricula,
        nome: nome,
        cidade: cidade,
        estado: estado,
      ),
    );

    return result;
  }
}