import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teste_dev_flutter/app/data/models/cart_item.dart';
import 'package:teste_dev_flutter/app/data/models/product.dart';
import 'package:teste_dev_flutter/app/data/models/user_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxInt currentIndex = 0.obs;
  final storageUser = GetStorage('user');
  UserModel user = UserModel();
  final storageProdutos = GetStorage('produtos');

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
