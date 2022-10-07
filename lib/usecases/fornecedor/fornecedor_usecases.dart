import 'package:fornecedores/repositories/fornecedor_repository.dart';
import 'package:fornecedores/usecases/fornecedor/create_fornecedor/create_fornecedor_controller.dart';
import 'package:fornecedores/usecases/fornecedor/create_fornecedor/create_fornecedor_usecase.dart';
import 'package:fornecedores/usecases/fornecedor/delete_fornecedor/delete_fornecedor_controller.dart';
import 'package:fornecedores/usecases/fornecedor/delete_fornecedor/delete_fornecedor_usecase.dart';
import 'package:fornecedores/usecases/fornecedor/read_all_fornecedor/read_all_fornecedor_controller.dart';
import 'package:fornecedores/usecases/fornecedor/read_all_fornecedor/read_all_fornecedor_usecase.dart';
import 'package:fornecedores/usecases/fornecedor/update_fornecedor/update_fornecedor_controller.dart';
import 'package:fornecedores/usecases/fornecedor/update_fornecedor/update_fornecedor_usecase.dart';

class FornecedorUseCases {
  static final FornecedorRepository _fornecedorRepository = FornecedorRepository();

  static CreateFornecedorUseCase get createFornecedorUseCase => CreateFornecedorUseCase(_fornecedorRepository);
  static CreateFornecedorController get createFornecedorController => CreateFornecedorController(createFornecedorUseCase);

  static ReadAllFornecedorUseCase get readAllFornecedorUseCase => ReadAllFornecedorUseCase(_fornecedorRepository);
  static ReadAllFornecedorController get readAllFornecedorController => ReadAllFornecedorController(readAllFornecedorUseCase);

  static UpdateFornecedorUseCase get updateFornecedorUseCase => UpdateFornecedorUseCase(_fornecedorRepository);
  static UpdateFornecedorController get updateFornecedorController => UpdateFornecedorController(updateFornecedorUseCase);

  static DeleteFornecedorUseCase get deleteFornecedorUseCase => DeleteFornecedorUseCase(_fornecedorRepository);
  static DeleteFornecedorController get deleteFornecedorController => DeleteFornecedorController(deleteFornecedorUseCase);
}
