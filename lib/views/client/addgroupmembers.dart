import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:privyr/Provider/textprovider.dart';
import 'package:privyr/Widgets/buttonContainer.dart';
import 'package:privyr/Widgets/customfeild.dart';
import 'package:privyr/style/style.dart';
import 'package:provider/provider.dart';
import '../../Provider/apiprovider.dart';
import 'package:timeago/timeago.dart' as timeago;

class addgroupmembers extends StatefulWidget {
  const addgroupmembers({super.key});

  @override
  State<addgroupmembers> createState() => _addgroupmembersState();
}

class _addgroupmembersState extends State<addgroupmembers> {
  List<int> selectindex = [];
  List<Map<String, dynamic>> seletedclient = [];
  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<apiprovider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Add group members",
          style: butttonstyle,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
            child: CustomSearchField(hinttext: "Search clients.."),
          ),
        ),
      ),
      body: Stack(
        children: [
          Expanded(
            child: Container(
              height: 500,
              child: ListView.separated(
                itemCount: clientProvider.data?['data']?.length ?? 0,
                itemBuilder: (context, index) {
                  bool ischeaked = selectindex.contains(index);
                  var client =
                      clientProvider.data!['data'][index]['attributes'];
                  String? createdAt = client['createdAt'];
                  String timeAgo = createdAt != null
                      ? timeago.format(DateTime.parse(createdAt))
                      : 'Unknown';

                  return Column(
                    children: [
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              client['name'] != null
                                  ? client['name'].substring(0, 2).toUpperCase()
                                  : "",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        title: Text(
                          client['name'] ?? 'No Name',
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context
                                  .watch<Changetextprovider>()
                                  .getnoteindex(index),
                            ),
                            Text(timeAgo),
                          ],
                        ),
                        trailing: Checkbox(
                          shape: CircleBorder(),
                          value: ischeaked,
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectindex.add(index);
                                seletedclient.add(client);
                              } else {
                                selectindex.remove(index);
                                seletedclient.remove(client);
                              }
                            });
                          },
                        ),
                        onTap: () {
                          Navigator.pop(context, client);
                        },
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
          ),
          if (selectindex.isNotEmpty)
            buttoncontainer(
              color:  Color(0Xff16a2b5),
              text: "Add group Members",
              iccon: Icons.person_add_alt_1,
              ontap: () {
                Navigator.pop(context, seletedclient);
              },
            ).animate().shakeX().scaleXY()
        ],
      ),
    );
  }
}
