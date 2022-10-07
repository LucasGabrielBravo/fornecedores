import 'package:fornecedores/routes/app_routes.dart';
import 'package:fornecedores/screens/home/home_bindings.dart';
import 'package:fornecedores/screens/home/home_screen.dart';
import 'package:fornecedores/screens/initial/initial_bindings.dart';
import 'package:fornecedores/screens/initial/initial_screen.dart';
import 'package:fornecedores/screens/signin/signin_bindings.dart';
import 'package:fornecedores/screens/signin/signin_screen.dart';
import 'package:fornecedores/screens/signup/signup_bindings.dart';
import 'package:fornecedores/screens/signup/signup_screen.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.initial, page: () => const InitialScreen(), binding: InitialBindings()),
    GetPage(name: Routes.home, page: () => const HomeScreen(), binding: HomeBindings()),
    GetPage(name: Routes.signUp, page: () => const SignupScreen(), binding: SignupBindings()),
    GetPage(name: Routes.signIn, page: () => const SignInScreen(), binding: SignInBindings()),
  ];
}
