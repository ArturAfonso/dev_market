import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:teste_dev_flutter/app/data/global/components/quantity_widget.dart';
import 'package:teste_dev_flutter/app/data/global/util_services.dart';
import 'package:teste_dev_flutter/app/data/models/cart_item.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  const CartTile({super.key, required this.cartItem, required this.remove});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    final UtilServices utilServices = UtilServices();
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: ListTile(
          //imagem
          leading: Image.network(
            widget.cartItem.product.thumbnail.toString(),
            height: 60,
            width: 60,
          ),
          //titulo
          title: Text(
            widget.cartItem.product.title.toString(),
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          //total
          subtitle: Text(
              utilServices.priceToCurrency(widget.cartItem.totalPrice()),
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          //quantidade
          trailing: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: QuantityWidget(
              qtd: widget.cartItem.quantity,
              result: (quantity) {
                setState(() {
                  widget.cartItem.quantity = quantity;
                  if (quantity == 0) {
                    //remove item do carrinho
                    widget.remove(widget.cartItem);
                  }
                });
              },
              isRemovable: true,
            ),
          ),
        ),
      ),
    );
  }
}
