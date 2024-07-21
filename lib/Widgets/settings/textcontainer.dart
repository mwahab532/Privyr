import 'package:flutter/material.dart';
import 'package:privyr/style/style.dart';
import 'package:privyr/views/client/InviteTeam.dart';

class prfcontainer extends StatelessWidget {
  const prfcontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          settingsOption(
            title: "Settings",
            onpressed: () {},
          ),
          Divider(),
          settingsOption(
            title: "Lead Forms",
            onpressed: () {},
          ),
          Divider(),
          settingsOption(title: "integration", onpressed: () {}),
          Divider(),
          settingsOption(
            title: "Invite Team",
            onpressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InviteTeam(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class settingsOption extends StatelessWidget {
  settingsOption({required this.title, required this.onpressed});
  String title;
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            style: Accountprfstyle,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
          onPressed: onpressed,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class Aligntext extends StatelessWidget {
  Aligntext({required this.headling, this.style});
  String headling;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          headling,
          style: style,
        ),
      ),
    );
  }
}
