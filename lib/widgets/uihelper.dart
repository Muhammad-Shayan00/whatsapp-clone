import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper{


  static CustomButton({required VoidCallback callback,required String buttonname}){
    
    return SizedBox(
      height: 40,
      width: 350,
      child: ElevatedButton(onPressed: (){
        callback();
      }, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
          child: Text(buttonname,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w400,),

      )),
    );
  }

  static CustomText({required String text,required double size,Color? color,FontWeight? fontweight}){

    return Text(text,style: TextStyle(fontSize: size,color:color?? Color(0XFF5E5E5E),fontWeight: fontweight,fontFamily:'f1' ),);
  }


  static CustomContainer({ required TextEditingController controller1}){

    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          color: Color(0xFFD6D6D6),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            style: TextStyle(
              fontSize: 20.0, // Set your desired font size here
            ),
            controller: controller1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none
            ),
          ),
        ),
      ),

    );
  }

}