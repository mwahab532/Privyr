import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_speed_dial/material_speed_dial.dart';
import 'package:privyr/Provider/apiprovider.dart';
import 'package:privyr/Provider/currentviewprovider.dart';
import 'package:privyr/Provider/textprovider.dart';
import 'package:privyr/Widgets/customfeild.dart';
import 'package:privyr/style/style.dart';
import 'package:privyr/views/client/Group.dart';
import 'package:privyr/views/client/Quickdd&sendmessage.dart';
import 'package:privyr/views/client/ResponsePage.dart';
import 'package:privyr/views/client/Team.dart';
import 'package:privyr/views/client/addnewclient.dart';
import 'package:privyr/views/client/importcontect.dart';
import 'package:privyr/views/client/searchpage.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

class Allclients extends StatefulWidget {
  const Allclients({Key? key}) : super(key: key);

  @override
  State<Allclients> createState() => _AllclientsState();
}

class _AllclientsState extends State<Allclients> {
  List<String> sortOptions = [
    'All',
    'id',
    'Alphabetically [A-Z]',
    'Newest',
    'Oldest'
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final clientprovider = Provider.of<apiprovider>(context);
    final clientstate = Provider.of<currentview>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomSearchField(
            hinttext: "Search clients & phonebook...",
            Ontap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      Search(),
                ),
              );
            },
          ),
        ),
        bottom: Tab(
          child: Row(
            children: [
              Tab(
                child: TextButton(
                  child: Text("All clients", style: butttonstyle),
                  onPressed: () {
                    clientstate.changecurrentview("Allclients");
                  },
                ),
              ),
              Tab(
                child: TextButton(
                  child: Text("Team", style: butttonstyle),
                  onPressed: () {
                    clientstate.changecurrentview("Team");
                  },
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffcf5cff),
                      ),
                    ),
                    TextButton(
                      child: Text("Group", style: butttonstyle),
                      onPressed: () {
                        clientstate.changecurrentview("Group");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: _getview(clientstate.Currentview),
    );
  }

  Widget _getview(String currentview) {
    switch (currentview) {
      case "Team":
        return Team();
      case "Group":
        return Group();
      default:
        return AllclientsView();
    }
  }

  Widget AllclientsView() {
    return RefreshIndicator(
      onRefresh: () async {
        final clientprovider = Provider.of<apiprovider>(context, listen: false);
        await clientprovider.getdata();
        if (!mounted) return;
        setState(() {});
      },
      child: Consumer<apiprovider>(
        builder: (context, apiprovider, child) {
          if (apiprovider.isapidataLoading) {
            return _buildshimmerList();
          }
          if (apiprovider.errormessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    apiprovider.errormessage,
                    style: errormessagestyle,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                      Color(0xFF16a2b5),
                    )),
                    onPressed: () async {
                      await apiprovider.getdata();
                      if (!mounted) return;
                      setState(() {});
                    },
                    child: Text(
                      "Retry",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }
          if (apiprovider.data == null ||
              apiprovider.data!['data'] == null ||
              apiprovider.data!['data'].isEmpty) {
            return Center(child: Text("No clients available."));
          }

          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "Sort by ${apiprovider.selectedvalue}",
                            style: Sortstyle,
                          )),
                      IconButton(
                        icon: Icon(Icons.arrow_drop_down_sharp),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 330,
                                width: double.infinity,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: double.infinity,
                                      color: Colors.grey,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          "Sorting by ${apiprovider.selectedvalue}",
                                          style: bottomsheettextstyle,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: sortOptions.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            leading: Icon(Icons.sort),
                                            title: Text(
                                              sortOptions[index],
                                              style: textbuttonstyle,
                                            ),
                                            onTap: () {
                                              setState(
                                                () {
                                                  apiprovider.updateSort(
                                                    sortOptions[index],
                                                  );
                                                },
                                              );
                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // ListView.builder
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Container(
                    color: Colors.white,
                    height: 510,
                    width: double.infinity,
                    child: apiprovider.isapidataLoading
                        ? _buildshimmerList()
                        : ListView.separated(
                            itemCount: apiprovider.data?['data']?.length ?? 0,
                            itemBuilder: (context, index) {
                              var client = apiprovider.data!['data'][index]
                                  ['attributes'];
                              String? createdAt = client['createdAt'];
                              // ignore: unused_local_variable
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
                                              ? client['name']
                                                  .substring(0, 2)
                                                  .toUpperCase()
                                              : "",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      client['name'] ?? 'No Name',
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          context
                                              .watch<Changetextprovider>()
                                              .getnoteindex(index),
                                        ),
                                        Text(timeAgo),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ResponsePage(
                                            clientdata: apiprovider
                                                .data!['data'][index],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider();
                            },
                          ),
                  ),
                ),
              ],
            ),
            floatingActionButton: ClipOval(
              child: SpeedDial(
                overlayColor: Colors.black.withOpacity(0.75),
                invokeAfterClosing: true,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                expandedChild: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                backgroundColor: Color(0xFF16a2b5),
                expandedBackgroundColor: Color(0xFF16a2b5),
                children: [
                  SpeedDialChild(
                    backgroundColor: Color(0xFF16a2b5),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    label: Text("Quick add and Send Message",
                        style: speed_Dialstyle),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Quickadd(),
                        ),
                      );
                    },
                  ),
                  SpeedDialChild(
                    backgroundColor: Color(0xFF16a2b5),
                    child: Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    label: Text("Enter new contect", style: speed_Dialstyle),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => newclient()),
                      );
                    },
                  ),
                  SpeedDialChild(
                    backgroundColor: Color(0xFF16a2b5),
                    child:
                        Icon(Icons.contact_page_outlined, color: Colors.white),
                    label: Text(
                      "Import From Phonebook",
                      style: speed_Dialstyle,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => importcontect()));
                    },
                  ),
                ],
              ).animate().scaleXY(curve: Curves.ease, delay: 500.ms),
            ),
          );
        },
      ),
    );
  }

  Widget _buildshimmerList() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                width: 56,
                height: 56,
                color: Colors.white,
              ),
              title: Container(
                width: double.infinity,
                height: 16,
                color: Colors.white,
              ),
              subtitle: Container(
                width: double.infinity,
                height: 16,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
