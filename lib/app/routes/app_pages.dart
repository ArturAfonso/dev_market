import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/productScreen/bindings/product_screen_binding.dart';
import '../modules/productScreen/views/product_screen_view.dart';
import '../modules/sing_up/bindings/sing_up_binding.dart';
import '../modules/sing_up/views/sing_up_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SING_UP,
      page: () => SingUpView(),
      binding: SingUpBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_SCREEN,
      page: () => ProductScreenView(),
      binding: ProductScreenBinding(),
    ),
  ];
}
