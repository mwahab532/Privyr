import 'package:flutter/material.dart';
import 'package:privyr/Widgets/buttonContainer.dart';
import 'package:privyr/controller/controllers.dart';
import 'package:privyr/style/style.dart';

class newmessagetemp extends StatefulWidget {
  const newmessagetemp({super.key});

  @override
  State<newmessagetemp> createState() => _newmessagetempState();
}

class _newmessagetempState extends State<newmessagetemp> {
  controller mycontroller = controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "New message templet",
          style: tempStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Title",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                maxLines: 5,
                minLines: 1,
                controller: mycontroller.titlecontroller,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "e.g. Ask about coffee.",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Templet Message",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                maxLines: 5,
                minLines: 1,
                controller: mycontroller.messagetroller,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "HI@clientName",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
          ),
          buttoncontainer(
            color: Color(0Xff16a2b5),
            text: "create & use Message",
            ontap: () {
              if (mycontroller.titlecontroller.text.isNotEmpty &&
                  mycontroller.messagetroller.text.isNotEmpty) {
                Navigator.pop(
                  context,
                  {
                    'title': mycontroller.titlecontroller.text,
                    'content': mycontroller.messagetroller.text,
                    'status': "Not yet send"
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }
}
