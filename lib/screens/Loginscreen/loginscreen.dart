import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/OTP%20Screen/otpscreen.dart';
import 'package:whatsapp_clone/widgets/uihelper.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String countrySelected = "Pakistan";
  List<String> countries = [
    "Pakistan",
    "China",
    "Russia",
    "America",
    "India",
    "Palestine",
  ];

  TextEditingController countrycode = TextEditingController();
  TextEditingController phonenoController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            UiHelper.CustomText(
              text: "Enter your phone number",
              size: 22,
              color: Color(0XFF00A884),
              fontweight: FontWeight.w700,
            ),
            SizedBox(height: 50),
            UiHelper.CustomText(
              text: "WhatsApp will need to verify your phone",
              size: 14,
              fontweight: FontWeight.w400,
            ),
            SizedBox(height: 5),
            UiHelper.CustomText(
              text: "number. Carrier charges may apply",
              size: 14,
              fontweight: FontWeight.w400,
            ),
            SizedBox(height: 5),
            UiHelper.CustomText(
              text: "What’s my number?",
              color: Color(0XFF00A884),
              size: 16,
              fontweight: FontWeight.w400,
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: DropdownButtonFormField<String>(
                value: countrySelected,
                items:
                    countries.map((String country) {
                      return DropdownMenuItem<String>(
                        child: Text(country),
                        value: country,
                      );
                    }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    countrySelected = newValue!;
                  });
                },

                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF00A884)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF00A884)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: countrycode,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "+92",
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0XFF05AA82)),
                              ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0XFF00A884)),
                          ),
                          ),



                        ),

                    ),
                  SizedBox(width: 10,),
                  SizedBox(
                    width: 210,
                    child: TextField(
                      controller: phonenoController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(

                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0XFF05AA82)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFF00A884)),
                        ),
                      ),



                    ),



                  ),

                ]
                  ),
          ],
        ),
      ),
      floatingActionButton:UiHelper.CustomButton(callback: (){
        login(countrycode.text.toString(),phonenoController.text.toString());

      }, buttonname: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }

  void login(String countrycode,String phoneno2) {

    String phonenumbertosend=countrycode+" "+phoneno2;
    if (countrycode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter country code"),),);
    }
    if (phoneno2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter phone number"),),);
    }
    else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Otpscreen(phonenumberrecived:phonenumbertosend ,),
        ),
      );
    }
  }
}



