import 'package:flutter/material.dart';
import 'package:privyr/style/style.dart';
import 'package:privyr/views/client/addgroupmembers.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewScreen extends StatefulWidget {
  final String groupNameController;

  NewScreen({
    required this.groupNameController,
  });

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  List<Map<String, dynamic>> selectedClients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(widget.groupNameController),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          if (selectedClients.isEmpty) ...[
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.person_off_outlined,
                size: 39,
                color: Color(0xFF16a2b5),
              ),
            ),
            Text(
              "This group has no members",
              style: butttonstyle,
            ),
            TextButton(
              child: Text(
                "Add group members",
                style: TextStyle(color: Color(0xFF16a2b5), fontSize: 15),
              ),
              onPressed: () async {
                final route = MaterialPageRoute(
                  builder: (context) => addgroupmembers(),
                );
                final result = await Navigator.push(context, route);
                if (result != null) {
                  setState(() {
                    selectedClients = result;
                  });
                }
              },
            )
          ],
          if (selectedClients.isNotEmpty)
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: selectedClients.length,
                itemBuilder: (context, index) {
                  var client = selectedClients[index];
                  String? createdAt = client['createdAt'];
                  String timeAgo = createdAt != null
                      ? timeago.format(DateTime.parse(createdAt))
                      : 'Unknown';
                  return Container(
                    color: Colors.white,
                    child: ListTile(
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
                      title: Text(client['name'] ?? 'No Name'),
                      subtitle: Text(timeAgo),
                    ),
                  );
                },
              ),
            ),
      
        ],
      ),
    );
  }
}
