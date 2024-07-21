import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:privyr/Widgets/Quickaddwidget/Quick.dart';
import 'package:privyr/Widgets/buttonContainer.dart';
import 'package:privyr/style/style.dart';
import 'package:privyr/views/client/selectmessagetemplet.dart';

class Quickadd extends StatefulWidget {
  const Quickadd({super.key});

  @override
  State<Quickadd> createState() => _QuickaddState();
}

class _QuickaddState extends State<Quickadd> {
  final TextEditingController clientnameController = TextEditingController();
  final TextEditingController mobilenumberController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController DisplaynameController = TextEditingController();
  final TextEditingController wahtappController = TextEditingController();
  final TextEditingController NoteController = TextEditingController();
  String? selctedmessagecontent;
  bool isvisble = false;
  String appbartitle = "";
  final scrollController = ScrollController();
  final _formkey = GlobalKey<FormState>();

  String countrycode = "";

  void _updatescrollcontroller() {
    if (scrollController.offset > 0) {
      setState(() {
        appbartitle = "Quick Add and send message";
      });
    } else {
      setState(() {
        appbartitle = "";
      });
    }
  }

  @override
  void initState() {
    scrollController.addListener(() {
      _updatescrollcontroller();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade100,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              appbartitle,
              style: quickmesagestyle,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Form(
              key: _formkey, // Wrap the form with a Form widget
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Met someone new?",
                      style: quickmesagebodystyle,
                    ),
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Quickly add them to your client list and send a personalised message",
                      style: quickstyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        quickmessagedfeilds(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "This field can't be left blank";
                            }
                            return null;
                          },
                          textname: " Client \n Name",
                          controller: clientnameController,
                          hintname: 'e.g client name',
                        ),
                        Divider(),
                        quickmessagedfeilds(
                          textname: " Display\n Name",
                          controller: DisplaynameController,
                          hintname: 'e.g Majid Naru',
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      isvisble
                          ? Text("Display name what your client will see")
                          : TextButton(
                              child: Text(
                                "show more Fields",
                                style: TextStyle(color: Colors.indigo),
                              ),
                              onPressed: () {
                                setState(() {
                                  isvisble = !isvisble;
                                });
                              },
                            ),
                      Icon(
                        Icons.arrow_drop_down,
                      )
                    ],
                  ),
                  isvisble
                      ? Column(
                          children: [
                            Container(
                              width: double.infinity,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  quickmessagedfeilds(
                                    txt1: countrycode.toString(),
                                    textname: " Phone \n Number",
                                    controller: mobilenumberController,
                                    hintname: 'e.g 0311545615635',
                                    iconButton: IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        showCountryPicker(
                                          countryListTheme:
                                              CountryListThemeData(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                          context: context,
                                          onSelect: (Country value) {
                                            print("${value.countryCode}");
                                            setState(() {
                                              countrycode =
                                                  value.phoneCode.toString();
                                            });
                                          },
                                          showPhoneCode: true,
                                        );
                                      },
                                    ),
                                  ),
                                  Divider(),
                                  quickmessagedfeilds(
                                    txt1: countrycode.toString(),
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return "This field can't be left blank";
                                      }
                                      return null;
                                    },
                                    textname: " Whatsapp \n NUMBER",
                                    controller: wahtappController,
                                    hintname: 'e.g 12123146',
                                    iconButton: IconButton(
                                      icon: Icon(Icons.arrow_drop_down),
                                      onPressed: () {
                                        showCountryPicker(
                                          countryListTheme:
                                              CountryListThemeData(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                          context: context,
                                          onSelect: (Country value) {
                                            print("${value.countryCode}");
                                            setState(() {
                                              countrycode =
                                                  value.phoneCode.toString();
                                            });
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Container(
                              height: 80,
                              width: double.infinity,
                              color: Colors.white,
                              child: quickmessagedfeilds(
                                textname: "Email Address",
                                controller: emailController,
                                hintname: 'e.g majid@privyr.com',
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Container(
                              height: 120,
                              width: double.infinity,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      "Note",
                                      style: clientanamestyle,
                                    ),
                                  ),
                                  TextFormField(
                                    maxLines: 5,
                                    minLines: 1,
                                    controller: NoteController,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        hintText:
                                            "Add notes about your client here...",
                                        hintStyle: TextStyle(fontSize: 15),
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(left: 10, top: 10)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 9,
                  ),
                  Container(
                    height: 220,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 10),
                              child: Text(
                                "MESSAGE",
                                style: clientanamestyle,
                              ),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => messageTemplet(),
                                  ),
                                );
                                if (result != null) {
                                  setState(() {
                                    selctedmessagecontent = result;
                                    messageController.text =
                                        selctedmessagecontent!;
                                  });
                                }
                              },
                              child: Text(
                                "Select Message template",
                                style: templetebuttonstyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, right: 10),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            )
                          ],
                        ),
                        TextFormField(
                          maxLines: 5,
                          minLines: 1,
                          controller: messageController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              hintText:
                                  "Enter a message to send to this client...",
                              hintStyle: TextStyle(fontSize: 15),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(left: 10, top: 10)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
            text: "SEND WHATSAPP",
            iccon: FontAwesomeIcons.whatsapp,
            ontap: () {
              if (_formkey.currentState!.validate()) {
                print("Successful");
              }
            },
          )
        ],
      ),
    );
  }
}
