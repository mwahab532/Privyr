import 'package:flutter/material.dart';
import 'package:privyr/Widgets/buttonContainer.dart';
import 'package:privyr/style/style.dart';
import 'package:privyr/views/Content/selectclient.dart';

class examplemessage extends StatelessWidget {
  final Map<String, String> message;
  const examplemessage({Key? key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          message['title']!,
          style: titstyle2,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                message['content']!,
                style: contentstyle,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SizedBox(
            height: 330,
          ),
          buttoncontainer(
            gradient: LinearGradient(
              colors: [
                Color(0Xff16a2b5).withOpacity(0.5),
                Color(0xffbf67f2),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomCenter,
            ),
            text: "Send to client",
            iccon: Icons.telegram_rounded,
            ontap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      SelectClient(message: message),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
