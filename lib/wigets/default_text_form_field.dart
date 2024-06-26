import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultTextFormFiled extends StatelessWidget {
  String? Function(String?) validator;
  TextInputType ? keyBoard ;
  String? hintText ;
   DefaultTextFormFiled({super.key, required this.validator ,
     this.keyBoard , this.hintText, });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyBoard,
      decoration: InputDecoration(
        hintText: hintText
      ),
    );
  }
}
// Function
Widget defaultFormField ({  String? Function(String?)? validator}){
  return TextFormField(
    validator: validator,

  );
}