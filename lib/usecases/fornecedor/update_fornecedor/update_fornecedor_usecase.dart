import 'package:fornecedores/models/fornecedor.dart';
import 'package:fornecedores/repositories/fornecedor_repository.dart';
import 'package:fornecedores/usecases/fornecedor/update_fornecedor/update_fornecedor_dto.dart';

class UpdateFornecedorUseCase {
  final FornecedorRepository _fornecedorRepository;

  UpdateFornecedorUseCase(this._fornecedorRepository);

  Future<String?> execute(UpdateFornecedorDTO data) async {
    try {
      await _fornecedorRepository.update(Fornecedor(
        matricula: data.matricula,
        nome: data.nome,
        cidade: data.cidade,
        estado: data.estado,
      ));
      
      return null;
    } catch (e) {
      return 'Erro ao atualizar fornecedor';
    }
  }
}
