import 'package:android_proj/product_model.dart';
import 'package:flutter/material.dart';
// import 'package:ecommerce/product_model.dart';

// ignore: must_be_immutable
class CartListPage extends StatefulWidget {
  
  List<Products> products;
  CartListPage({super.key, required this.products});

  @override
  State<CartListPage> createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {
  double total = 0;
  @override
  void initState() {
    
    for(var i in widget.products){
      total += (i.desc * i.counter);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cart',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.products.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 30,
                        ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[30],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ListTile(
                          leading: Image.asset(widget.products[index].pic),
                          title: Text(
                            widget.products[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          subtitle: Text(
                            '${widget.products[index].desc * widget.products[index].counter} L.E',
                            style: const TextStyle(fontSize: 15),
                          ),
                          trailing: Text(
                            '${widget.products[index].counter}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 30,),
                Text('Total: $total L.E', style: const TextStyle(fontSize: 20),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
