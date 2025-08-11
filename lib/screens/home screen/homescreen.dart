

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/callscreen/callscreen.dart';
import 'package:whatsapp_clone/screens/camerascreen/camerascreen.dart';
import 'package:whatsapp_clone/screens/chatsscreen/chatsscreen.dart';
import 'package:whatsapp_clone/screens/statusscreen/statusscreen.dart';
import 'package:whatsapp_clone/widgets/uihelper.dart';

class homescreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 105,
          title: UiHelper.CustomText(
            text: "Whatsapp",
            size: 22,
            color: Colors.white,
            fontweight: FontWeight.w500,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(onPressed: (){}, icon: Image.asset("assets/images/search.png")),
            )
          ],
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.camera_alt),),
            Tab(text: "CHATS",),
            Tab(text: "STATUS",),
            Tab(text: "CALLS",),
          ],
          indicatorColor: Colors.white,),
          backgroundColor: Color(0xFF008069),
        ),

        body: TabBarView(children: [
          camerascreen(),
          chatsscreen(),
          statusscreen(),
          callscreen(),
        ]),

      ),
    );

  }

}