import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/onboardingscreen/onboardingscreen.dart';
import 'package:whatsapp_clone/widgets/uihelper.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return OnBoardingScreen();}));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/whatsapp 1.png"),
            SizedBox(height: 20,),
            UiHelper.CustomText(text: "Whatsapp", size: 18,color: Colors.black,fontweight: FontWeight.w700)
          ],
        ),
      ),

    );
  }
}