import 'package:flutter/material.dart';

import 'package:privyr/style/style.dart';

class FollowUps extends StatelessWidget {
  const FollowUps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Follow Ups",
          style: AppbarStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Followups(
                    optiontext: "OVERDUE",
                    color: Colors.red,
                    icon: Icons.calendar_month,
                    numbercolor: Colors.red,
                    onpressed: () {},
                  ),
                  Divider(),
                  Followups(
                    optiontext: "UPCOMMING",
                    color: Colors.black,
                    icon: Icons.calendar_month,
                    onpressed: () {},
                  ),
                  Divider(),
                  Followups(
                    optiontext: "SOMEDAY",
                    color: Colors.grey,
                    icon: Icons.calendar_month,
                    numbercolor: Colors.grey,
                    onpressed: () {},
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Followups(
                  icon: Icons.calendar_today,
                  optiontext: "Today(0)",
                  color: Colors.indigo,
                  onpressed: () {},
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Followups extends StatelessWidget {
  const Followups({
    super.key,
    required this.icon,
    required this.optiontext,
    required this.color,
    this.numbercolor,
    required this.onpressed,
  });

  final IconData icon;
  final String optiontext;
  final Color color;
  final Color? numbercolor;
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            optiontext,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 15,
            ),
          ),
          Spacer(),
          Text(
            "0",
            style: TextStyle(
              color: numbercolor,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 15,
            ),
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
