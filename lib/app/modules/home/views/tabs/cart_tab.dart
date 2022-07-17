import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teste_dev_flutter/app/data/global/components/cart_tile.dart';
import 'package:teste_dev_flutter/app/data/global/constants.dart';
import 'package:teste_dev_flutter/app/data/global/util_services.dart';
import 'package:teste_dev_flutter/app/data/models/cart_item.dart';
import 'package:teste_dev_flutter/app/data/models/product.dart';
import 'package:teste_dev_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:teste_dev_flutter/app/data/appData.dart' as appData;

class CartTab extends StatefulWidget {
  List<CartItemModel> cart;
  CartTab({super.key, required this.cart});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  HomeController homeController = HomeController();
  //final storageCartProdutos = GetStorage('cart');
  final UtilServices utilServices = UtilServices();
  //List<CartItemModel> cartItems = <CartItemModel>[];

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      appData.cartItems.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double total = 0;
    setState(() {
      for (var product in appData.cartItems) {
        total += product.totalPrice();
      }
    });
    return total;
  }

  late String totalPrice;

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appForegroundColor,
          title: Text(
            "Carrinho",
            style: TextStyle(color: Colors.black54),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: appData.cartItems.length > 0
                        ? appData.cartItems.length
                        : 1, //cartItems.length,
                    itemBuilder: (_, index) {
                      //return Text(cartItems[index].product.title.toString());
                      if (appData.cartItems.length > 0)
                        return GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: CartTile(
                            cartItem: appData.cartItems[index],
                            remove: removeItemFromCart,
                          ),
                        );
                      else
                        return Container(
                          color: Colors.transparent,
                        );
                    })),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3,
                        spreadRadius: 2)
                  ],
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          utilServices.priceToCurrency(cartTotalPrice()),
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.update,
                              color: Colors.black54,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () async {
                          bool? result = await showOrderConfirmation();
                          if (result == true) {
                            setState(() {
                              appData.cartItems.clear();
                            });
                          }
                          print(result);
                        },
                        child: Text("Concluir pedido",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text("Confirmação"),
            content: Text("Deseja realmente concluir o pedido?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  "não",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  "sim",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }
}
