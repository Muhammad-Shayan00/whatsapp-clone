
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/screens/home%20screen/homescreen.dart';

import '../../widgets/uihelper.dart';

class ProfileScreen extends StatefulWidget{
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextEditingController namecontroller = TextEditingController();
  File? pickedimage;

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            UiHelper.CustomText(
              text: "Profile info",
              size: 22,
              color: Color(0XFF00A884),
              fontweight: FontWeight.w700,
            ),
            SizedBox(height: 50),
            UiHelper.CustomText(
              text: "Please provide your name and an optional",
              size: 14,
              fontweight: FontWeight.w400,
            ),
            SizedBox(height: 5),
            UiHelper.CustomText(
              text: "profile photo",
              size: 14,
              fontweight: FontWeight.w400,
            ),
            SizedBox(height: 50),
            Center(
              child: GestureDetector(
                onTap: () {
                  _openbottom(context);
                },
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: Color(0xFFD6D6D6),
                  backgroundImage: pickedimage != null ? FileImage(pickedimage!) : null,
                  child: pickedimage == null
                      ? Image.asset(
                    'assets/images/aa.png',
                    height: 50,
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 243,
                  child: TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      hintText: "Type your name here",

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
                  width: 30,
                  child: Image.asset('assets/images/happyface1.png'),
                )


              ],
            ),



          ],
        ),

      ),
      floatingActionButton:UiHelper.CustomButton(callback: (){

        Navigator.push(context, MaterialPageRoute(builder: (context){return homescreen();}));

      }, buttonname: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }

  _openbottom(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Color(0xFF00A884),
          height: 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                    _pickimage(ImageSource.camera);
                  }, icon: Icon(Icons.camera_alt, size: 80, color: Colors.grey),),
                  SizedBox(width: 150),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                    _pickimage(ImageSource.gallery);
                  }, icon: Icon(Icons.photo, size: 80, color: Colors.grey),),

                ],
              ),
            ],
          ),
        );
      },
    );
  }

  _pickimage(ImageSource imagesource)async{

    try{
      final photo=await ImagePicker().pickImage(source: imagesource);
      if(photo==null)return;
      Navigator.pop(context);
      final tempimage=File(photo.path);
      setState(() {
        pickedimage=tempimage;
      });



    }
    catch(ex){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.toString(),),backgroundColor: Color(0XFF00A884),));

    }

  }
}