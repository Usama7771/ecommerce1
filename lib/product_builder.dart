import 'package:android_proj/product_model.dart';
import 'package:android_proj/product_page.dart';
import 'package:flutter/material.dart';
// import 'package:ecommerce/product_model.dart';
// import 'package:ecommerce/product_page.dart';

// ignore: must_be_immutable
class ProductBuilder extends StatefulWidget {
  Products product;
  ProductBuilder({super.key, required this.product});

  @override
  State<ProductBuilder> createState() => _ProductBuilderState();
}

class _ProductBuilderState extends State<ProductBuilder> {
  @override
  Widget build(BuildContext context) {
    return
        // InkWell(
        // onTap: () {

        //   Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => pages[index])
        //   );
        // },

        // child:
        InkWell(
          onTap: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (_)=> ProductPage(product: widget.product,)));
          },
          child: Container(
              height: 90,
              width: 160,
              decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
          // image: DecorationImage(
          //   fit: BoxFit.fitWidth,
          //   image: AssetImage(product.pic),
        
          // ),
              ),
              child: Column(
          children: [
            Image.asset(widget.product.pic,height: 100, fit: BoxFit.cover,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.product.name,
                  style: TextStyle(fontSize: 17, color: Colors.grey[700]),
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
            Text('${widget.product.desc} L.E')
          ],
              ),
              // ),
            ),
        );
  }
}
