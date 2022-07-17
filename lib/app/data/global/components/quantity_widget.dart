import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class QuantityWidget extends StatefulWidget {
  final int qtd;
  final Function(int quantity) result;
  final bool isRemovable;
  QuantityWidget(
      {super.key,
      required this.qtd,
      required this.result,
      this.isRemovable = false});

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 1,
                blurRadius: 2,
              )
            ]),
        child: GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: _quantityButton(
                  icon: !widget.isRemovable || widget.qtd > 1
                      ? Icons.remove
                      : Icons.delete_forever,
                  color: !widget.isRemovable || widget.qtd > 1
                      ? Colors.grey
                      : Colors.red,
                  onpressed: () {
                    setState(() {
                      if (widget.qtd == 1 && !widget.isRemovable) {
                      } else {
                        int resultCount = widget.qtd - 1;
                        widget.result(resultCount);
                        print(resultCount);
                      }
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.qtd.toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: _quantityButton(
                  icon: Icons.add,
                  color: Colors.blue,
                  onpressed: () {
                    setState(() {
                      int resultCount = widget.qtd + 1;
                      widget.result(resultCount);
                      print(resultCount);
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _quantityButton extends StatefulWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onpressed;

  const _quantityButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onpressed,
  }) : super(key: key);

  @override
  State<_quantityButton> createState() => _quantityButtonState();
}

class _quantityButtonState extends State<_quantityButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: widget.onpressed,
          child: Ink(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
            ),
            child: Icon(
              widget.icon,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
