import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teste_dev_flutter/app/data/appData.dart';
import 'package:teste_dev_flutter/app/data/global/constants.dart';
import 'package:teste_dev_flutter/app/data/models/product.dart';
import 'package:teste_dev_flutter/app/modules/home/views/tabs/cart_tab.dart';
import 'package:teste_dev_flutter/app/modules/home/views/tabs/favorites_tab.dart';
import 'package:teste_dev_flutter/app/modules/home/views/tabs/home_tab.dart';
import 'package:teste_dev_flutter/app/modules/home/views/tabs/profile_tab.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  List<BottomNavigationBarItem> itens = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Carrinho"),
    BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favoritos"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
  ];

  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeTab(),
          CartTab(cart: []),
          FavoriteTab(),
          ProfileTab(user: controller.user),
        ],
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            fixedColor: Colors.black,
            unselectedItemColor: Colors.black54.withAlpha(100),
            backgroundColor: appForegroundColor,
            items: itens,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              controller.currentIndex.value = index.toInt();
              pageController.jumpToPage(index);
            },
          )),
    );
  }
}
