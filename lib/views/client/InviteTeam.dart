import 'package:flutter/material.dart';
import 'package:privyr/Widgets/InviteTeam/myObjects.dart';
import 'package:privyr/Widgets/buttonContainer.dart';
import 'package:privyr/Widgets/settings/textcontainer.dart';
import 'package:privyr/style/style.dart';

class InviteTeam extends StatefulWidget {
  const InviteTeam({super.key});

  @override
  State<InviteTeam> createState() => _InviteTeamState();
}

class _InviteTeamState extends State<InviteTeam> {
  bool showoptions = false;
  bool ischeak = false;
  bool isdone = false;
  bool isgroup = false;
  bool iseditgroup = false;
  bool isdelet = false;
  bool isdeleteclient = false;
  bool isallow = false;
  bool isteam = false;
  bool ismanage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          "Invite Team Members",
          style: inviteTeamstyle,
        ),
        actions: [
          TextButton(
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Aligntext(
                    headling: "Email Address",
                    style: invitebodyStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Textfeildcontainer(),
                  SizedBox(
                    height: 8,
                  ),
                  Aligntext(
                    headling: "Basic Permission",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  mycontainer(),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showoptions = !showoptions;
                      });
                    },
                    child: showoptions
                        ? Aligntext(
                            headling: "Advance Permissions",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : Text(
                            "SHOW ADVANCE PERMISSIONS",
                            style: TextStyle(
                              color: Color(0xff51758c),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  if (showoptions)
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Aligntext(
                                headling: "Add & Edit content",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Aligntext(
                                headling:
                                    "Allow user to add and edit content for \nthe team:",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              buildcheakboxRow("Dont't Allow", ischeak,
                                  (value) {
                                setState(() {
                                  ischeak = value ?? false;
                                });
                              }),
                              buildcheakboxRow(
                                  "Allow adding & editting content", isdone,
                                  (value) {
                                setState(() {
                                  isdone = value ?? false;
                                });
                              }),
                              Divider(),
                              Aligntext(
                                headling: "Add & Edit Groups",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Aligntext(
                                headling:
                                    "Allow user to add and edit client groups \nthe team:",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              buildcheakboxRow(
                                "Don't Allow",
                                isgroup,
                                (value) {
                                  setState(() {
                                    isgroup = value ?? false;
                                  });
                                },
                              ),
                              buildcheakboxRow(
                                "Allow adding & editing group",
                                iseditgroup,
                                (value) {
                                  setState(() {
                                    iseditgroup = value ?? false;
                                  });
                                },
                              ),
                              Divider(),
                              Aligntext(
                                headling: "Delete Clients",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Aligntext(
                                headling:
                                    "Allow user to permemently delete clients groups form team:",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              buildcheakboxRow("Don't Allow", isdelet, (value) {
                                setState(() {
                                  isdelet = value ?? false;
                                });
                              }),
                              buildcheakboxRow(
                                "Allow deletting Clients",
                                isdeleteclient,
                                (value) {
                                  setState(() {
                                    isdeleteclient = value ?? false;
                                  });
                                },
                              ),
                              Divider(),
                              Aligntext(
                                headling: "Manage Team members",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Aligntext(
                                headling:
                                    "Allow user to create,edit and manage team members and permissions",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              buildcheakboxRow("Don't Allow", isallow, (value) {
                                setState(() {
                                  isallow = value ?? false;
                                });
                              }),
                              buildcheakboxRow(
                                "Allow managing team members",
                                isdeleteclient,
                                (value) {
                                  setState(() {
                                    isteam = value ?? false;
                                  });
                                },
                              ),
                              Divider(),
                              Aligntext(
                                headling: "Manage Integrations",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Aligntext(
                                headling:
                                    "Allow user to manage integrations and Import/export clients:",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              buildcheakboxRow("Don't Allow", isteam, (value) {
                                setState(() {
                                  isteam = value ?? false;
                                });
                              }),
                              buildcheakboxRow(
                                "Allow managing integrations",
                                ismanage,
                                (value) {
                                  setState(() {
                                    ismanage = value ?? false;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          buttoncontainer(
            text: "Send Invites",
          ),
        ],
      ),
    );
  }
}

Widget buildcheakboxRow(String txt, bool value, ValueChanged<bool?> onchange) {
  return Row(
    children: [
      Checkbox(value: value, onChanged: onchange),
      Text(
        txt,
        style: TextStyle(
          color: value ? Color(0xff51758c) : Colors.black,
        ),
      )
    ],
  );
}
