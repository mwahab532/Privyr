import 'package:flutter/material.dart';
import 'package:privyr/Widgets/InviteTeam/myObjects.dart';
import 'package:privyr/Widgets/Quickresponce.dart/ListTile.dart';
import 'package:privyr/Widgets/buttonContainer.dart';
import 'package:privyr/style/style.dart';
import 'package:privyr/views/bottombar/content.dart';

// ignore: must_be_immutable
class ResponsePage extends StatefulWidget {
  ResponsePage({
    super.key,
    required this.clientdata,
  });

  final Map<String, dynamic> clientdata;

  @override
  State<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
  String appbartitle = "";
  final scrollController = ScrollController();

  void _updatescrollcontroller() {
    if (scrollController.offset > 0) {
      setState(() {
        appbartitle = widget.clientdata['attributes']['name'];
      });
    } else {
      setState(() {
        appbartitle = "";
      });
    }
  }

  @override
  void initState() {
    scrollController.addListener(() {
      _updatescrollcontroller();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mobile = widget.clientdata["attributes"]["mobile"] ?? 0;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          appbartitle,
          textAlign: TextAlign.left,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Customsheet(context);
            },
            child: Text(
              "Options",
              style: AppbarStyle,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 560,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Text(
                          widget.clientdata['attributes']['name'],
                          style: bodyStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Rowbuttons(mobile: mobile),
                  Divider(),
                  TestLead(),
                ],
              ),
            ),
          ),
          buttoncontainer(
            gradient: LinearGradient(
              colors: [Color(0Xff16a2b5).withOpacity(0.5), Color(0xffbf67f2)],
              begin: Alignment.centerLeft,
              end: Alignment.bottomCenter,
            ),
            text: "QUICK RESPONSE",
            iccon: Icons.telegram,
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Content(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget? Customsheet(BuildContext context) {
    showModalBottomSheet(
      shape: Border(),
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Options",
                    style: bottomsheettextstyle,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  print("Clients");
                },
                child: custombottomsheet(
                  icon: Icons.edit,
                  text: "Edite Clients",
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {},
                child: custombottomsheet(
                  icon: Icons.person_add_alt,
                  text: "Marked as contacted",
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              custombottomsheet(
                icon: Icons.group,
                text: "Add to group",
              ),
              Divider(),
              SizedBox(height: 10),
              custombottomsheet(
                icon: Icons.book_online_rounded,
                text: "Add to PhoneBook",
              ),
              Divider(),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {},
                child: custombottomsheet(
                  icon: Icons.delete,
                  text: "Delete Clients",
                ),
              ),
            ],
          ),
        );
      },
    );
    return null;
  }
}
