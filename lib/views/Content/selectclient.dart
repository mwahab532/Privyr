import 'package:flutter/material.dart';
import 'package:privyr/Provider/apiprovider.dart';
import 'package:privyr/Provider/textprovider.dart';
import 'package:privyr/Widgets/customfeild.dart';
import 'package:privyr/views/Content/Send&Review.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class SelectClient extends StatelessWidget {
  const SelectClient({super.key, required this.message});
  final Map<String, String> message;

  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<apiprovider>(context);

    if (clientProvider.data == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            height: 43,
            child: CustomSearchField(
              hinttext: "Search clients & phonebook...",
            ),
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: clientProvider.data?['data']?.length ?? 0,
        itemBuilder: (context, index) {
          var client = clientProvider.data!['data'][index]['attributes'];
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
                      context.watch<Changetextprovider>().getnoteindex(index),
                    ),
                    Text(timeAgo),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Sendmessagetoclient(
                        message: message,
                        clientname: client['name'],
                        mobile: client["mobile"],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
