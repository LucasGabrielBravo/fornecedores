import 'package:fornecedores/models/fornecedor.dart';
import 'package:fornecedores/repositories/fornecedor_repository.dart';

class ReadAllFornecedorUseCase {
  final FornecedorRepository _fornecedorRepository;

  ReadAllFornecedorUseCase(this._fornecedorRepository);

  Future<List<Fornecedor>> execute() async {
    return await _fornecedorRepository.readAll();
  }
}
