import 'package:fornecedores/repositories/fornecedor_repository.dart';
import 'package:fornecedores/usecases/fornecedor/delete_fornecedor/delete_fornecedor_dto.dart';

class DeleteFornecedorUseCase {
  final FornecedorRepository _fornecedorRepository;

  DeleteFornecedorUseCase(this._fornecedorRepository);

  Future<Exception?> execute(DeleteFornecedorDTO data) async {
    try {
      await _fornecedorRepository.delete(data.matricula);

      return null;
    } catch (e) {
      throw Exception('Erro ao deletar fornecedor');
    }
  }
}
