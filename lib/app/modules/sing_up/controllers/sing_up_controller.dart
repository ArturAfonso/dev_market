import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teste_dev_flutter/app/data/models/user_model.dart';

class SingUpController extends GetxController {
  final storageUser = GetStorage('user');
  //TODO: Implement SingUpController

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController cpfController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  cadastrarUsuario(String email, senha, nome, phone, cpf) {
    storageUser.erase();
    UserModel newuser = UserModel(
        email: email, password: senha, name: nome, phone: phone, cpf: cpf);
    storageUser.write('user', newuser);
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
