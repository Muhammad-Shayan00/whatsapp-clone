import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/Loginscreen/loginscreen.dart';

import '../../widgets/uihelper.dart';

class OnBoardingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text("On Boarding Screen"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/bb.png"),
            SizedBox(height: 20,),
            UiHelper.CustomText(text: "Welcome to WhatsApp", size: 20,color: Colors.black,fontweight: FontWeight.w400),
            SizedBox(height: 20,),
            Center(
              child: RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Read out",style: TextStyle(fontSize: 14,color: Color(0XFF5E5E5E),fontWeight: FontWeight.w400)),
                    TextSpan(text: " Privacy Policy.", style: TextStyle(fontSize: 14,color: Color(0XFF0C42CC),fontWeight: FontWeight.w400)),
                    TextSpan(text: " Tap “Agree and continue”",style: TextStyle(fontSize: 14,color: Color(0XFF5E5E5E),fontWeight: FontWeight.w400)),
                  ]
              )),
            ),
            Center(
              child: RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "to accept the",style: TextStyle(fontSize: 14,color: Color(0XFF5E5E5E),fontWeight: FontWeight.w400)),
                    TextSpan(text: " Terms of Service", style: TextStyle(fontSize: 14,color: Color(0XFF0C42CC),fontWeight: FontWeight.w400)),
                  ]
              )),
            )

          ],
        ),

      ),
      floatingActionButton:UiHelper.CustomButton(callback: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();}));

      }, buttonname: "Agree & Continue"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}