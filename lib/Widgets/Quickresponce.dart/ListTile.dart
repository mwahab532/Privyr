import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:privyr/Provider/noteprovider.dart';
import 'package:privyr/Provider/textprovider.dart';
import 'package:privyr/Widgets/InviteTeam/myObjects.dart';
import 'package:privyr/Widgets/Quickresponce.dart/Timelinetile.dart';
import 'package:privyr/Widgets/buttonContainer.dart';
import 'package:privyr/style/style.dart';
import 'package:privyr/views/client/Activity.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TestLead extends StatefulWidget {
  const TestLead({
    super.key, 

  });

 

  @override
  State<TestLead> createState() => _TestLeadState();
}

class _TestLeadState extends State<TestLead> {
  var textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print("wahab");
          },
          child: ListTile(
            title: Text(
              "FoLLow UP",
              style: tileStyle,
            ),
            subtitle: Text(
              "No foLLow up scheduled",
              style: subtitleStyle,
            ),
          ),
        ),
        Divider(),
        ListTile(
          title: Text(
            "Groups",
            style: tileStyle,
          ),
          subtitle: Text(
            "Tap to add groups",
            style: subtitleStyle,
          ),
        ),
        Divider(),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: double.infinity,
                            color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Notes",
                                style: bottomsheettextstyle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              maxLines: 5,
                              minLines: 1,
                              controller: textcontroller,
                              cursorColor: Colors.black,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          Spacer(),
                          buttoncontainer(
                            color: Color(0Xff16a2b5),
                            text: "Save",
                            iccon: Icons.save,
                            ontap: () {
                              context.read<Changetextprovider>().changeValue(
                                  value: textcontroller.text, index: 0);

                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: ListTile(
            title: Text(
              "Note",
              style: tileStyle,
            ),
            subtitle: Consumer<Changetextprovider>(
              builder: (context, value, child) {
                return Text(
                  context.watch<Changetextprovider>().getnoteindex(0),
                  style: TextStyle(color: Colors.black),
                );
              },
            ),
          ),
        ),
        Divider(),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "TIMELINE",
              style: tileStyle,
            ),
          ),
        ),
        TimeLineTile(
          isFirst: true,
          isLast: false,
          isPast: true,
          endchild: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  bottomsheet(context);
                },
                child: Text(
                  "Add activity",
                  style: TextStyle(color: Color(0xFF437d9c)),
                ),
              ),
            ],
          ),
        ),
        TimeLineTile(
          isFirst: false,
          isLast: false,
          isPast: true,
          endchild: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              context.watch<NoteProvider>().Note,
            ),
          ),
        ),
        TimeLineTile(
          isFirst: false,
          isLast: true,
          isPast: true,
        )
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onpressed;
  final IconData icon;
  CustomButton({required this.onpressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      onPressed: onpressed,
      backgroundColor: Color(0xFF16a2b5),
      child: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}

class Rowbuttons extends StatelessWidget {
  const Rowbuttons({
    super.key,
    required this.mobile,
  });

  final mobile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          CustomButton(
              onpressed: () async {
                final url = "tel:$mobile";
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("call app not installed")));
                }
              },
              icon: Icons.call),
          SizedBox(
            width: 18,
          ),
          CustomButton(
              onpressed: () async {
                final url = 'sms:$mobile?body=Hello!';
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Message app not installed")));
                }
              },
              icon: FontAwesomeIcons.message),
          SizedBox(
            width: 18,
          ),
          CustomButton(
              onpressed: () async {
                const email = 'example@gmail.com';
                final url = 'mailto:$email';
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Gmail app not installed")));
                }
              },
              icon: Icons.email),
          SizedBox(
            width: 18,
          ),
          CustomButton(
            onpressed: () async {
              final url = 'whatsapp://send?phone=$mobile';
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("WhatsApp not installed")));
              }
            },
            icon: FontAwesomeIcons.whatsapp,
          ),
        ],
      ),
    );
  }
}

Widget? bottomsheet(BuildContext context) {
  showModalBottomSheet(
    shape: Border(),
    context: context,
    builder: (context) {
      return Container(
        height: 250,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Options",
                  style: bottomsheettextstyle,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: custombottomsheet(
                icon: Icons.note,
                text: "Phone Call",
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: custombottomsheet(
                icon: Icons.chat,
                text: "Messages",
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            custombottomsheet(
              icon: FontAwesomeIcons.meetup,
              text: "Meeting",
            ),
            Divider(),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) => Activity(),
                );
                Navigator.push(context, route);
              },
              child: custombottomsheet(
                icon: Icons.note,
                text: "Note",
              ),
            ),
          ],
        ),
      );
    },
  );
  return null;
}
