import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:teste_dev_flutter/app/data/global/util_services.dart';
import 'package:teste_dev_flutter/app/data/models/cart_item.dart';
import 'package:teste_dev_flutter/app/data/models/product.dart';
import 'package:teste_dev_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:teste_dev_flutter/app/modules/productScreen/views/product_screen_view.dart';
import 'package:teste_dev_flutter/app/routes/app_pages.dart';

class ItemTile extends StatelessWidget {
  final Product itemproduct;
  ItemTile({super.key, required this.itemproduct});
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    List<CartItemModel> cart = <CartItemModel>[];
    return Stack(
      children: [
        //conteudo
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductScreenView(item: itemproduct);
            }));
          },
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey.shade300,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //img
                  Expanded(
                      //height: Get.size.height / 4,
                      child: Hero(
                          tag: itemproduct.thumbnail.toString(),
                          child:
                              Image.network(itemproduct.thumbnail.toString()))),
                  //title
                  Text(
                    itemproduct.title.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  //preço
                  Text(
                    utilServices.priceToCurrency(itemproduct.price),
                    style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                        color: Colors.green),
                  )
                ],
              ),
            ),
          ),
        ),
        //adicionar ao carrinho
      ],
    );
  }
}
