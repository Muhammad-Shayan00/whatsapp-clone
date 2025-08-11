import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../../widgets/uihelper.dart';


class statusscreen extends StatelessWidget {
  Uint8List decodeBase64Image(String base64Image) {
    final base64String = base64Image.split(',').last;
    return base64Decode(base64String);
  }
  var arrContent = [
    {
      "images":
      "data:image/jpeg;base64,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",
      "name": "Shayan",
      "lastmessage": "1 min ago",
      "time": "1 min ago",
      "noofmessages": "7",
    },
    {
      "images":
      "data:image/jpeg;base64,data:image/jpeg;base64,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",
      "name": "Api ",
      "lastmessage": "3 hours ago",
      "time": "3 hours ago",
      "noofmessages": "0",
    },



  ];

  @override
  Widget build(BuildContext context) {
    final String mydp = "data:image/png;base64,data:image/jpeg;base64,data:image/jpeg;base64,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";
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            children:  [
              SizedBox(width: 10),
              UiHelper.CustomText(
                text: "Status",
                size: 18,
                fontweight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: MemoryImage(decodeBase64Image(mydp)),
                  radius: 25,
                ),
                title: const Text("User Status",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                subtitle: Text("Tap to add status update",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400)),
              );
            },
          ),
          const SizedBox(height: 10),
          Row(
            children:  [
              SizedBox(width: 10),
              UiHelper.CustomText(
                text: "Recent Update",
                size: 16,
                fontweight: FontWeight.w400,
              ),
              SizedBox(width: 240),
              Icon(Icons.arrow_drop_down_sharp)
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: arrContent.length,
              itemBuilder: (context, index) {
                var chat = arrContent[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    MemoryImage(decodeBase64Image(chat["images"]!)),
                    radius: 25,
                  ),
                  title: Text(chat["name"] ?? '',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                  subtitle: Text(chat["lastmessage"] ?? '',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400)),

                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
