// ignore_for_file: body_might_complete_normally_nullable

import 'package:android_proj/enum.dart';
import 'package:android_proj/home_page.dart';
import 'package:android_proj/shared/cache_helper.dart';
import 'package:flutter/material.dart';
// import 'package:ecommerce/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? value1;
  String? name;
  var nameControler = TextEditingController();
  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();
  var mobileControler = TextEditingController();
  var repeatPasswordControler = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isVisible = true;
  bool isVisibleR = true;
  bool isSigned = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Stack(children: <Widget>[
          // White background
          Container(
            color: Colors.white,
          ),
          // Wave design
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 200,
                color: Colors.indigo,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'sign up',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              name = value;
                              return RegExp('[a-zA-Z]').hasMatch(value!)
                                  ? null
                                  : 'Enter a Valid Name';
                            },
                            controller: nameControler,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'name',
                              labelText: 'Name',
                              // suffixIcon: Icon(Icons.mail),
                              // labelStyle: TextStyle(fontSize: 15)
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value!)
                                  ? null
                                  : 'please enter valid mail';
                            },
                            controller: emailControler,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'email',
                              labelText: 'Email',
                              suffixIcon: const Icon(Icons.mail),
                              // labelStyle: TextStyle(fontSize: 15)
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: mobileControler,
                            validator: (value) {
                              if (value!.length != 11) {
                                return 'please enter valid number';
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Phone number',
                              suffixIcon: const Icon(Icons.call),
                              labelText: 'phone',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: isVisible,
                            obscuringCharacter: '*',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter valid password';
                              }
                              value1 = value;
                            },
                            controller: passwordControler,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'Password',
                              labelText: 'password',
                              suffixIcon: IconButton(
                                icon: isVisible
                                    ? const Icon(Icons.remove_red_eye)
                                    : const Icon(Icons.remove_red_eye_outlined),
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                    // obsecureText = isVisible;
                                    
                                  });
                                },
                              ),
                              // labelStyle: TextStyle(fontSize: 15)
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: isVisibleR,
                            obscuringCharacter: '*',
                            validator: (value) {
                              if (value != value1) {
                                return 'please repeat password correctly';
                              }
                            },
                            controller: repeatPasswordControler,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintText: 'repeat password',
                              labelText: 'repeat password',
                              suffixIcon: IconButton(
                                icon: isVisibleR
                                    ? const Icon(Icons.remove_red_eye)
                                    : const Icon(Icons.remove_red_eye_outlined),
                                onPressed: () {
                                  setState(() {
                                    isVisibleR = !isVisibleR;
                                    // obsecureText = isVisible;
                                    
                                  });
                                },
                              ),
                              // labelStyle: TextStyle(fontSize: 15)
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                
                                
                                    CacheHelper.putString(key: SharedKey.email, value: emailControler.text);
                                    CacheHelper.putString(key: SharedKey.accountName, value: nameControler.text);
                                    CacheHelper.putString(key: SharedKey.phoneNumber, value: mobileControler.text);
                                    isSigned = true;
                                    CacheHelper.putBool(key: SharedKey.isSigned, value: isSigned);
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()),
                                            (route) => false);
                                  
                                
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                backgroundColor: Colors.black54,
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: const Size(100, 30)),
                            child: const Text('Sign up'),
                          ),
                        ]),
                  ),
                )),
          ),
        ]));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 50);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 100);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
