import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:privyr/Widgets/buttonContainer.dart';
import 'package:privyr/style/style.dart';
import 'package:url_launcher/url_launcher.dart';

class Sendmessagetoclient extends StatelessWidget {
  const Sendmessagetoclient({
    super.key,
    required this.message,
    this.clientname,
    required this.mobile,
  });

  final Map<String, String> message;
  final String? clientname;
  final mobile;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              "Sending to ${clientname}",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Hi $clientname,\n" + message["content"]!,
                  style: contentstyle,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
          buttoncontainer(
            color: Color(0Xff16a2b5),
            text: "Send Via Whatsapp",
            iccon: FontAwesomeIcons.whatsapp,
            ontap: () async {
              final url =
                  'whatsapp://send?phone=$mobile&text=${Uri.encodeComponent(message["content"]!)}';
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("WhatsApp not installed")));
              }
            },
          ),
        ],
      ),
    );
  }
}
