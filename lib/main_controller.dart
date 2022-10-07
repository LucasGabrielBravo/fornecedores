import 'package:fornecedores/models/user.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  late User _user;

  User get user => _user;
  set user(User value) {
    _user = value;
    update();
  }

  static MainController get to => Get.find();
}
