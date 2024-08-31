// ignore_for_file: file_names

import 'package:fitpro/widget/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardTYpe;
  final bool obscureText;
  final TextStyle?style;
  final bool maxLines;

 

   const CustomTextFormField({
    super.key,
    required this.labelText,
    this.hintText = '',
    required this.controller,
    this.validator,
    this.keyboardTYpe = TextInputType.text,
    this.obscureText =false,
    this.style,
     this.maxLines= false,

    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Focus.of(context).unfocus();
      },
      child: TextFormField(
        maxLines: 5,
        controller: controller,
        style: style?? const TextStyle(color: MyColors.White),
        decoration: InputDecoration(
          labelText: labelText,labelStyle:const TextStyle(color: MyColors.White),
          hintText: hintText,
          border:  OutlineInputBorder(borderRadius:BorderRadius.circular(10) ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
         ) ,
         validator: validator,
         keyboardType: keyboardTYpe,
         obscureText: obscureText,
      ),
    );
  }
}