import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teste_dev_flutter/app/data/global/components/quantity_widget.dart';
import 'package:teste_dev_flutter/app/data/global/util_services.dart';
import 'package:teste_dev_flutter/app/data/models/cart_item.dart';
import 'package:teste_dev_flutter/app/data/models/favorites_model.dart';
import 'package:teste_dev_flutter/app/data/models/product.dart';
import 'package:teste_dev_flutter/app/data/models/user_model.dart';
import 'package:teste_dev_flutter/app/modules/home/controllers/home_controller.dart';

import '../controllers/product_screen_controller.dart';
import 'package:teste_dev_flutter/app/data/appData.dart' as appData;

class ProductScreenView extends StatefulWidget {
  ProductScreenView({Key? key, this.item}) : super(key: key);

  Product? item;

  @override
  State<ProductScreenView> createState() => _ProductScreenViewState();
}

class _ProductScreenViewState extends State<ProductScreenView> {
  List<FavoriteItemModel> favoritos = <FavoriteItemModel>[];
  final storageFavorites = GetStorage('favorites');
  final UtilServices utilsServices = UtilServices();
  ProductScreenController productScreenController = ProductScreenController();
  HomeController homeController = HomeController();

  int cartItemQuantity = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (storageFavorites.read('favorites') != null) {
      var temp = storageFavorites.read('favorites');
      temp.forEach((item) {
        FavoriteItemModel itemTemp = item;
        favoritos.add(itemTemp);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withAlpha(230),
        body: Stack(
          children: [
            //content
            Column(
              children: [
                Expanded(
                    child: Hero(
                  tag: widget.item!.thumbnail.toString(),
                  child: Image.network(
                    widget.item!.thumbnail.toString(),
                    filterQuality: FilterQuality.high,
                  ),
                )),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade600, offset: Offset(0, 2))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.star_border)),
                          QuantityWidget(
                            qtd: cartItemQuantity,
                            result: (quantity) {
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                            },
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          widget.item!.title.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(utilsServices.priceToCurrency(widget.item!.price),
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                      Expanded(
                          child: Container(
                        color: Colors.transparent,
                      )),
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                            icon: Icon(Icons.shopping_cart_checkout_outlined),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              appData.cartItems.add(CartItemModel(
                                  product: widget.item!,
                                  quantity: cartItemQuantity));
                              Navigator.of(context).pop();
                            },
                            label: Text("adicionar",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                      )
                    ],
                  ),
                ))
              ],
            ),
            Positioned(
              left: 10,
              top: 10,
              child: SafeArea(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios))),
            )
          ],
        ));
  }
}
