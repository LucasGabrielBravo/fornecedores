import 'package:fornecedores/models/fornecedor.dart';
import 'package:fornecedores/usecases/fornecedor/read_all_fornecedor/read_all_fornecedor_usecase.dart';

class ReadAllFornecedorController {
  final ReadAllFornecedorUseCase _readAllFornecedorUseCase;

  ReadAllFornecedorController(this._readAllFornecedorUseCase);

  Future<List<Fornecedor>> handle() async {
    return await _readAllFornecedorUseCase.execute();    
  }
}