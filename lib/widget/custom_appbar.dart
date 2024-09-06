
import 'package:fitpro/widget/colors.dart';
import 'package:flutter/material.dart';

customAppBar(BuildContext context,{
  required String text1,
  IconData? icons, 
  bool back=true,
   }){
  return AppBar(
        automaticallyImplyLeading: back,
        iconTheme: const IconThemeData(color: MyColors.White),
        backgroundColor:MyColors.DBlack,
        actions: [
          Builder(
            builder: (context) {
              return Padding(
                padding:const EdgeInsets.all(8.0),
                child: IconButton(icon: Icon(icons),onPressed: (){
                  Scaffold.of(context).openEndDrawer();
                }, ),
              );
            }
          )
        ],
        title:  Text(
          text1,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
         
      );
}