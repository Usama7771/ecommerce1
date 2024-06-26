import 'package:android_proj/new_product/new_product_model.dart';
import 'package:flutter/material.dart';
// import 'package:ecommerce/new_product/new_product_model.dart';

// ignore: must_be_immutable
class NewProductBuilder extends StatefulWidget {
  NewProduct newProduct;
  NewProductBuilder({super.key, required this.newProduct});

  @override
  State<NewProductBuilder> createState() => _NewProductBuilderState();
}

class _NewProductBuilderState extends State<NewProductBuilder> {
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
          leading: Image.asset(widget.newProduct.image),
          title: Text(widget.newProduct.title),
          trailing: IconButton(
              onPressed: () {
                setState(() {
                  widget.newProduct.like = !widget.newProduct.like;
                });
              },
              icon: widget.newProduct.like
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    )),
          subtitle: Text(widget.newProduct.price),
        ),
      ),
      // Column(
      //   children: [
      //     Image.asset(newProduct.image),
      //     Text(newProduct.title),
      //     IconButton(onPressed: (){}, icon: newProduct.like? Icon(Icons.favorite, color: Colors.red,)
      //     : Icon(Icons.favorite, color: Colors.grey,)),
      //   ],
      // ),
    );
  }
}
