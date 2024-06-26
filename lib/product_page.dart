import 'package:android_proj/cart_page/cart_list_page.dart';
import 'package:android_proj/product_model.dart';
import 'package:flutter/material.dart';
// import 'package:ecommerce/cart_page/cart_list_page.dart';
// import 'package:ecommerce/product_model.dart';
List <Products> cartItem = [];
// ignore: must_be_immutable
class ProductPage extends StatefulWidget {
  Products product;
  
  ProductPage({super.key, required this.product,});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(widget.product.pic)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(fontSize: 32),
                ),
                IconButton(
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
                          ))
              ],
            ),
            Text(
              '${widget.product.desc} L.E',
              style: const TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.grey[400],
                  radius: 20,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.product.counter++;
                        });
                      },
                      icon: const Icon(Icons.add)),
                ),
                Text(
                  '${widget.product.counter}',
                  style: const TextStyle(fontSize: 25),
                ),
                CircleAvatar(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.grey[400],
                  radius: 20,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.product.counter > 0) {
                            widget.product.counter--;
                          }
                        });
                      },
                      icon: const Icon(Icons.minimize)),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if(widget.product.counter > 0){
                    cartItem.add(widget.product);
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: Colors.black54,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(100, 30)),
              child: const Text(
                'Add to cart',
                style: TextStyle(fontSize: 30),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartListPage(products: cartItem)),
                    );
              },
              child: const Text(
                'Go to cart',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
