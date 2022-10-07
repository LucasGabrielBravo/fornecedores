import 'package:fornecedores/usecases/fornecedor/delete_fornecedor/delete_fornecedor_dto.dart';
import 'package:fornecedores/usecases/fornecedor/delete_fornecedor/delete_fornecedor_usecase.dart';

class DeleteFornecedorController {
  final DeleteFornecedorUseCase _deleteFornecedorUseCase;

  DeleteFornecedorController(this._deleteFornecedorUseCase);

  Future<Exception?> handle({required String matricula}) async {
    final result = await _deleteFornecedorUseCase.execute(DeleteFornecedorDTO(matricula: matricula));

    if (result is Exception) {
      return result;
    } else {
      return null;
    }
  }
}
