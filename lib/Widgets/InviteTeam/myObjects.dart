import 'package:flutter/material.dart';
import 'package:privyr/Widgets/settings/textcontainer.dart';
import 'package:privyr/style/style.dart';

class Textfeildcontainer extends StatelessWidget {
  const Textfeildcontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Type team member emails",
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

class mycontainer extends StatefulWidget {
  @override
  State<mycontainer> createState() => _mycontainerState();
}

class _mycontainerState extends State<mycontainer> {
  bool ischeak = false;

  bool isdone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Aligntext(headling: "Views Clients"),
          Aligntext(
            headling: "Select type of Clients this by user can view",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: ischeak,
                onChanged: (value) {
                  setState(() {
                    ischeak = value ?? false;
                  });
                },
              ),
              Text(
                "Client assinged to others",
                style: TextStyle(
                  color: ischeak ? Color(0xff51758c) : Colors.black,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: isdone,
                onChanged: (value) {
                  setState(() {
                    isdone = value ?? false;
                  });
                },
              ),
              Text(
                " Unassinged Clients",
                style: TextStyle(
                  color: ischeak ? Color(0xff51758c) : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class custombottomsheet extends StatelessWidget {
  const custombottomsheet({super.key, required this.icon, required this.text});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Color(0xFF437d9c),
          ),
          Aligntext(
            headling: text,
            style: TextStyle(
              color: Color(0xFF437d9c),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class GroupRowWiget extends StatelessWidget {
  const GroupRowWiget({
    super.key,
    required this.text,
    required this.title,
    this.iconData,
    required this.onpressed,
  });
  final String text;
  final String title;
  final IconData? iconData;
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Colors.black,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: Grouptextstyle,
          ),
          Spacer(),
          Text(
            text,
            style: Grouptextstyle,
          ),
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onPressed: onpressed),
        ],
      ),
    );
  }
}

class GroupPagesecondcontainer extends StatelessWidget {
  const GroupPagesecondcontainer({
    super.key,
    required this.intcount,
    required this.title,
    required this.onpressed,
    required this.color,
    required this.onpressedDel,
  });
  final String intcount;
  final String title;
  final Function() onpressed;
  final Function() onpressedDel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 10, width: 10, color: color),
          SizedBox(
            width: 6,
          ),
          Text(
            title,
            style: Grouptextstyle,
          ),
          Spacer(),
          Text(
            intcount,
            style: Grouptextstyle,
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              size: 18,
            ),
            onPressed: onpressedDel,
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onPressed: onpressed,
          ),
        ],
      ),
    );
  }
}
