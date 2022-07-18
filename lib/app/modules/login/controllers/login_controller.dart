import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teste_dev_flutter/app/data/global/constants.dart';
import 'package:teste_dev_flutter/app/data/models/product.dart';
import 'package:teste_dev_flutter/app/data/models/user_model.dart';
import 'package:teste_dev_flutter/app/data/repositories/product_repository.dart';
import 'package:teste_dev_flutter/app/routes/app_pages.dart';

final repository = Get.put(ProductRepository());

class LoginController extends GetxController {
  final storageUser = GetStorage('user');
  UserModel user = UserModel();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    var tempuser = storageUser.read('user');
    if (tempuser != null) {
      if (tempuser is UserModel) {
        user = tempuser;
      } else {
        user = UserModel.fromJson(tempuser);
      }
    }
  }

  login() {
    print(user.email);
    print(user.password);
    if (user != null) {
      if (user.email == emailController.text &&
          user.password == passwordController.text) {
        Get.offAllNamed(Routes.HOME, arguments: user);
      } else {
        Get.snackbar("Falha ao autenticar", "Email ou Senha incorretos",
            colorText: Colors.white,
            titleText: Text(
              "Falha ao autenticar",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: errorColor,
            duration: Duration(seconds: 4),
            icon: Icon(Icons.lock, color: Colors.white),
            shouldIconPulse: true);
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
