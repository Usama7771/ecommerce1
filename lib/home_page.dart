
import 'package:android_proj/cart_page/cart_page_builder.dart';
import 'package:android_proj/enum.dart';
import 'package:android_proj/login_page.dart';
import 'package:android_proj/new_product/new_product_model.dart';
import 'package:android_proj/product_builder.dart';
import 'package:android_proj/product_model.dart';
import 'package:android_proj/product_page.dart';
import 'package:android_proj/profile_page.dart';
import 'package:android_proj/shared/cache_helper.dart';
import 'package:android_proj/splash_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:ecommerce/new_product/new_product_model.dart';
// import 'package:ecommerce/product_builder.dart';
// import 'package:ecommerce/product_model.dart';
// import 'package:ecommerce/product_page.dart';
import 'cart_page/cart_list_page.dart';
import 'new_product/new_product_builder.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final images = [
    Image.asset('assets/image1.jpg'),
    Image.asset('assets/image2.jpg'),
    Image.asset('assets/image3.jpg'),
    Image.asset('assets/image4.jpg'),
    Image.asset('assets/image5.jpg'),
    Image.asset('assets/image6.jpg')
  ];
  List<String> images0 = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    // 'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
    // 'assets/image6.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.blue[300],
          title: const Text('Mostaql'),
          centerTitle: true,
        ),
        drawer: Drawer(
          
          child: ListView(
            children: [
              InkWell(
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage()),(route) => true
                      );
                },
                child: UserAccountsDrawerHeader (
                  accountEmail: Text('${CacheHelper.getString(key: SharedKey.email)}',style: TextStyle(color : Colors.white, fontSize: 15)),
                  accountName: Text('${CacheHelper.getString(key: SharedKey.accountName)}',style: TextStyle(color : Colors.grey[1000], fontSize: 20)),
                  currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                  ) ,
                  ),
              ),
              ListTile(
                title: Text('Profile' , style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.person , color:Colors.blue),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage()),(route) => true
                      );
                },
              ),
              Divider(color: Colors.black,),
              ListTile(
                title: Text('Cart' , style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.shopping_cart, color: Colors.blue,),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartListPage(products: cartItem)),(route) => true,
                      );
                },
              ),
              Divider(color: Colors.black,),
              ListTile(
                title: Text('Log out' , style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.logout, color: Colors.blue,),
                onTap: () {
                  CacheHelper.remove();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage()),
                      );
                },
              ),
              Divider(color: Colors.black,),
            ],
          ),
          
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Products',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                  ),
                  // SizedBox(
                  //   height: 150,
                  //   width: 300,
                  //   child: Swiper(
                  //     pagination: const SwiperPagination(builder: SwiperPagination.dots, ),
                  //     // control: const SwiperControl(),
                  //     autoplay: true,
                  //     // autoplayDisableOnInteraction: false,
                  //     itemBuilder: (context, index) {
                  //       return Image.asset(images[index]);
                  //     },
                  //     itemCount: images.length,
                  //     ),
                  // ),
                  SizedBox(
                    height: 200,
                    child: CarouselSlider(
                        items: images,
                        options: CarouselOptions(
                          autoPlay: true,
                        )),
                  ),
    
                  // SizedBox(
                  //   height: 100,
                  //   width: 100,
                  // ),
                  // Container(
                  //   height: 200,
                  //   width: 200,
                  //   decoration: BoxDecoration(
                  //     image: const DecorationImage(
                  //       fit: BoxFit.cover,
                  //       image: AssetImage("assets/image1.jpg"),
                  //       ),
                  //     color: Colors.black,
                  //     borderRadius: BorderRadius.circular(15),
                  //     // gradient: LinearGradient(
    
                  //     //   colors: [
                  //     //   Colors.black,
                  //     //   Colors.blue,
                  //     //   Colors.red,
                  //     // ])
    
                  //     ),
                  // ),
                  // Image.asset('lib/assets/Mostaqul/image1.jpg'),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Category',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                  ),
    
                  const SizedBox(
                    height: 30,
                  ),
    
                  // SizedBox(
                  //   height: 230,
                  //   width: double.infinity,
                  //   child: ListView.separated(
                  //     scrollDirection: Axis.horizontal,
                  //     shrinkWrap: true,
                  //     itemCount: 4,
                  //     separatorBuilder: (BuildContext context, int index) =>
                  //         const SizedBox(
                  //       width: 20,
                  //     ),
                  //     itemBuilder: (context, index) {
                  //       return ProductBuilder(product: itemproducts[index]);
                  //     },
    
                  //     //children: [
                  //     // Container(
                  //     //   height: 200,
                  //     //   width: 100,
                  //     //   decoration: BoxDecoration(
                  //     //   borderRadius: BorderRadius.circular(15),
                  //     //   color: Colors.black,
                  //     //   ),
                  //     // ),
                  //     // Container(
                  //     //   height: 200,
                  //     //   width: 100,
                  //     //   decoration: BoxDecoration(
                  //     //   borderRadius: BorderRadius.circular(15),
                  //     //   color: Color.fromARGB(255, 192, 110, 165),
                  //     //   ),
                  //     // ),
                  //     // Container(
                  //     //   height: 200,
                  //     //   width: 100,
                  //     //   decoration: BoxDecoration(
                  //     //   borderRadius: BorderRadius.circular(15),
                  //     //   color: Color.fromARGB(255, 52, 185, 81),
                  //     //   ),
                  //     // ),
    
                  //     //],
                  //   ),
                  // ),
    
                  const SizedBox(
                    height: 30,
                  ),
    
                  SizedBox(
                    width: double.infinity,
                    height: 350,
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: itemproducts.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                        ),
                        itemBuilder: (context, index) {
                          return ProductBuilder(product: itemproducts[index]);
                        }),
                  ),
    
                  const SizedBox(
                    height: 30,
                  ),
    
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: newProductList.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                      itemBuilder: (context, index) {
                        return NewProductBuilder(
                            newProduct: newProductList[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
