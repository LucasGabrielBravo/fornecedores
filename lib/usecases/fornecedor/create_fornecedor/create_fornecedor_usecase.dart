import 'package:fornecedores/models/fornecedor.dart';
import 'package:fornecedores/repositories/fornecedor_repository.dart';
import 'package:fornecedores/usecases/fornecedor/create_fornecedor/create_fornecedor_dto.dart';

class CreateFornecedorUseCase {
  final FornecedorRepository _fornecedorRepository;

  CreateFornecedorUseCase(this._fornecedorRepository);

  Future<Exception?> execute(CreateFornecedorDTO data) async {
    try {
      await _fornecedorRepository.create(Fornecedor(
        matricula: data.matricula,
        nome: data.nome,
        cidade: data.cidade,
        estado: data.estado,
      ));
      
      return null;
    } catch (e) {
      return Exception('Erro ao criar fornecedor');
    }
  }
}
