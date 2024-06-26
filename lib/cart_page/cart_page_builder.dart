import 'package:android_proj/product_model.dart';
import 'package:flutter/material.dart';
// import 'package:ecommerce/product_model.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  Products product;
   CartPage({super.key, required this.product});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(28),
      ),
      child: Center(
        child: ListTile(
          leading: Image.asset(widget.product.pic),
          title: Text(widget.product.name),
          trailing: IconButton(
              onPressed: () {
                setState(() {
                  widget.product.fave = !widget.product.fave;
                });
              },
              icon: widget.product.fave
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    )),
          subtitle: Text('${widget.product.desc} L.E'),
        ),
      ),
      // Column(
      //   children: [
      //     Image.asset(product.image),
      //     Text(product.title),
      //     IconButton(onPressed: (){}, icon: product.like? Icon(Icons.favorite, color: Colors.red,)
      //     : Icon(Icons.favorite, color: Colors.grey,)),
      //   ],
      // ),
    );
  }
}