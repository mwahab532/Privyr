import 'package:flutter/material.dart';
import 'package:privyr/Provider/apiprovider.dart';
import 'package:privyr/Widgets/InviteTeam/myObjects.dart';
import 'package:privyr/views/client/creategroup.dart';
import 'package:privyr/views/client/newcreen.dart';
import 'package:provider/provider.dart';

class Group extends StatefulWidget {
  const Group({super.key});

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  List<Map<String, dynamic>> grouplist = [
    {"name": "Not Interested", "color": Colors.grey},
    {"name": "Interested", "color": Colors.blue},
    {"name": "Meeting Booked", "color": Colors.green},
    {"name": "Proposal", "color": Colors.orange},
    {"name": "Negotiating", "color": Colors.red},
    {"name": "Purchased", "color": Colors.purple},
  ];
  List<Map<String, dynamic>> selectedClients = [];
  void Delete(String groupname) {
    setState(() {
      grouplist.removeWhere((group) => group['name'] == groupname);
    });
  }

  @override
  Widget build(BuildContext context) {
    final clientprovider = Provider.of<apiprovider>(context);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  GroupRowWiget(
                    iconData: Icons.star_border,
                    title: "UnContacted Leads",
                    text: clientprovider.data != null &&
                            clientprovider.data!["attributes"] != null
                        ? clientprovider.data!["attributes"]["leadIssue"] ?? "0"
                        : "0",
                    onpressed: () {},
                  ),
                  Divider(),
                  GroupRowWiget(
                    iconData: Icons.arrow_outward,
                    title: "BY LEAD SOURCE",
                    text: clientprovider.data != null &&
                            clientprovider.data!["attributes"] != null
                        ? clientprovider.data!["attributes"]["source"] ?? "0"
                        : "0",
                    onpressed: () {},
                  ),
                  Divider(),
                  GroupRowWiget(
                    iconData: Icons.email_outlined,
                    title: "RECENTLY VIEWED CONTENT",
                    text: clientprovider.data != null &&
                            clientprovider.data!["attributes"] != null
                        ? clientprovider.data!["attributes"]
                                ["leadEngagement"] ??
                            "0"
                        : "0",
                    onpressed: () {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            height: 320,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: grouplist.length,
                    itemBuilder: (context, index) {
                      return GroupPagesecondcontainer(
                        color: grouplist[index]['color'],
                        title: grouplist[index]['name'],
                        intcount: "0",
                        onpressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewScreen(
                                groupNameController: grouplist[index]['name'],
                              ),
                            ),
                          );
                        },
                        onpressedDel: () {
                          Delete(grouplist[index]['name']);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xFF16a2b5),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateGroupScreen(group: grouplist),
            ),
          );

          if (result == true) {
            setState(() {});
          }
        },
      ),
    );
  }
}
