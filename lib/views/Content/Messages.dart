import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:privyr/style/style.dart';
import 'package:privyr/views/Content/createfolder.dart';
import 'package:privyr/views/Content/examplemessage.dart';
import 'package:privyr/views/Content/newmessage.dart';

// ignore: must_be_immutable
class Message extends StatefulWidget {
  Message({super.key, required this.controller});
  TextEditingController controller = TextEditingController();

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final List<Map<String, String>> messages = [
    {
      "title": 'Example 1: First Message to a New Lead',
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

  List<String> sortOptions = [
    'Message title(A-Z)',
    'Message title(Z-A)',
    'Most Recently news',
    'Newest',
    'Oldest'
  ];
  String selectedValue = 'Message title(A-Z)';
  List<Map<String, String>> filltermessage = [];
  @override
  void initState() {
    super.initState();
    filltermessage = List.from(messages);
    widget.controller.addListener(_searchmessage);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_searchmessage);
    super.dispose();
  }

  void sortData(String option) {
    setState(() {
      selectedValue = option;
      switch (option) {
         case 'Message title(A-Z)':
          filltermessage.sort((a, b) => a['title']!.compareTo(b['title']!));
          break;
        case 'Message title(Z-A)':
          filltermessage.sort((a, b) => b['title']!.compareTo(a['title']!));
          break;
        case 'Most Recently Added':
          filltermessage.sort((a, b) => messages.indexOf(b).compareTo(messages.indexOf(a)));
          break;
        case 'Newest':
          filltermessage.sort((a, b) => DateTime.parse(a['date'] ?? '1970-01-01').compareTo(DateTime.parse(b['date'] ?? '1970-01-01')));
          break;
        case 'Oldest':
          filltermessage.sort((a, b) => DateTime.parse(b['date'] ?? '1970-01-01').compareTo(DateTime.parse(a['date'] ?? '1970-01-01')));
          break;
      }
    });
  }

  void addmessages(Map<String, String> message) {
    setState(() {
      messages.add(message);
      _searchmessage();
    });
  }

  void _searchmessage() {
    setState(() {
      final qury = widget.controller.text.toLowerCase();
      filltermessage = messages.where((element) {
        final title = element['title']!.toLowerCase();
        final content = element['content']!.toLowerCase();
        return title.contains(qury) || content.contains(qury);
      }).toList();
      sortData(selectedValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.folder_copy_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "FOLDERS",
                    style: Folderstyle,
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  createfolder(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
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
                      "Sort by $selectedValue",
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
                                    "Sorting by $selectedValue",
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
                                        sortData(sortOptions[index]);
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
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Container(
              height: 510,
              color: Colors.white,
              child: ListView.separated(
                itemCount: filltermessage.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      filltermessage[index]["title"]!,
                      style: tileStyle,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(filltermessage[index]["content"]!),
                        SizedBox(
                          height: 5,
                        ),
                        Text(filltermessage[index]["status"]!),
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
                      final route = MaterialPageRoute(
                        builder: (context) =>
                            examplemessage(message: filltermessage[index]),
                      );
                      Navigator.push(context, route);
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xFF16a2b5),
        onPressed: () async {
          final results = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => newmessagetemp(),
              ));
          if (results != null) {
            addmessages(results);
          }
        },
        child: Icon(
          FontAwesomeIcons.message,
          color: Colors.white,
        ),
      ).animate().scaleXY(delay: 500.ms),
    );
  }
}
