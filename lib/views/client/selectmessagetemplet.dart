import 'package:flutter/material.dart';
import 'package:privyr/Widgets/customfeild.dart';
import 'package:privyr/style/style.dart';

class messageTemplet extends StatefulWidget {
  const messageTemplet({super.key});

  @override
  State<messageTemplet> createState() => _messageTempletState();
}

class _messageTempletState extends State<messageTemplet> {
  final List<Map<String, String>> messages = [
    {
      'title': 'Example 1: First Message to a New Lead',
      'content':
          'Thank you for your interest in ACME Residences. I’ll be happy to share more details...',
      'status': 'Sent 1 time',
    },
    {
      'title': 'Example 2: Follow Up - Book Viewing',
      'content':
          'I wanted to follow up and check if you had any questions about ACME Residences, or if I could...',
      'status': 'Not sent yet',
    },
    {
      'title': 'Example 3: Follow Up - eBrochure',
      'content':
          'Hi @clientName, hope you had a chance to take a look at the ACME Residences eBrochure I sent last week. W...',
      'status': 'Sent 2 times',
    },
    {
      'title': 'Example 4: Meeting Reminder - Today',
      'content':
          'Good morning @clientName! 🌻 Looking forward to meeting you at the ACME Residences showflat for your...',
      'status': 'Not sent yet',
    },
    {
      'title': 'Example 5: Latest Promotions',
      'content':
          'Hi @clientName 👋 Hope you’re having a great week! I’m excited to share that the latest promotions for ACME...',
      'status': 'Not sent yet',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Select message templet",
          style: butttonstyle,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
            child: CustomSearchField(hinttext: "Search messages.."),
          ),
        ),
      ),
      body: Container(
        height: 600,
        color: Colors.grey.shade100,
        child: ListView.separated(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                messages[index]["title"]!,
                style: tileStyle,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(messages[index]["content"]!),
                  SizedBox(
                    height: 5,
                  ),
                  Text(messages[index]["status"]!),
                ],
              ),
              isThreeLine: true,
              trailing: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
              onTap: () {
                Navigator.pop(context, messages[index]["content"]);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
    );
  }
}
