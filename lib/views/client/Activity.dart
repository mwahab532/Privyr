import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:privyr/Provider/noteprovider.dart';
import 'package:privyr/Widgets/buttonContainer.dart';
import 'package:privyr/style/style.dart';
import 'package:provider/provider.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  TextEditingController notecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              "Add Activity",
              style: quickmesagestyle,
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(0xffbf67f2),
                  child: Icon(
                    FontAwesomeIcons.noteSticky,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Note",
                  style: notestyle,
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.white,
            child: TextFormField(
              maxLines: 5,
              minLines: 1,
              controller: notecontroller,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "Add optional details here...",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 10, top: 10)),
            ),
          ),
          buttoncontainer(
            color: Color(0xFF16a2b5),
            text: "Add ACTIVITY",
            iccon: Icons.done,
            ontap: () {
              context
                  .read<NoteProvider>()
                  .changeValue(value: notecontroller.text,);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
