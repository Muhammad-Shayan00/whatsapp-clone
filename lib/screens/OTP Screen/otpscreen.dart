import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/profile%20screen/profilescreen.dart';

import '../../widgets/uihelper.dart';

class Otpscreen extends StatelessWidget{


  TextEditingController otpcontroller1 = TextEditingController();
  TextEditingController otpcontroller2 = TextEditingController();
  TextEditingController otpcontroller3 = TextEditingController();
  TextEditingController otpcontroller4 = TextEditingController();
  TextEditingController otpcontroller5 = TextEditingController();
  TextEditingController otpcontroller6 = TextEditingController();

  String phonenumberrecived;
  Otpscreen({required this.phonenumberrecived});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            UiHelper.CustomText(
              text: "Verifying your number",
              size: 22,
              color: Color(0XFF00A884),
              fontweight: FontWeight.w700,
            ),
            SizedBox(height: 50),
            UiHelper.CustomText(
              text: "You’ve tried to register +${phonenumberrecived}",
              size: 14,
              fontweight: FontWeight.w400,
            ),
            SizedBox(height: 5),
            UiHelper.CustomText(
              text: "recently. Wait before requesting an sms or a call",
              size: 14,
              fontweight: FontWeight.w400,
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              UiHelper.CustomText(
                text: " with your code. ",
                size: 14,
                fontweight: FontWeight.w400,
              ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);

                  },
                  child: UiHelper.CustomText(
                    text: "Wrong number?",
                    color: Color(0XFF00A884),
                    size: 16,
                    fontweight: FontWeight.w400,
                  ),
                )

            ],),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              UiHelper.CustomContainer(controller1: otpcontroller1),
                SizedBox(width: 10,),
                UiHelper.CustomContainer(controller1: otpcontroller2),
                SizedBox(width: 10,),
                UiHelper.CustomContainer(controller1: otpcontroller3),
                SizedBox(width: 10,),
                UiHelper.CustomContainer(controller1: otpcontroller4),
                SizedBox(width: 10,),
                UiHelper.CustomContainer(controller1: otpcontroller5),
                SizedBox(width: 10,),
                UiHelper.CustomContainer(controller1: otpcontroller6),


            ],),
            SizedBox(height: 60),
            UiHelper.CustomText(
              text: "Didn’t receive code?",
              color: Color(0XFF00A884),
              size: 16,
              fontweight: FontWeight.w400,
            ),



          ],
        )

      ),
      floatingActionButton:UiHelper.CustomButton(callback: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );


      }, buttonname: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}