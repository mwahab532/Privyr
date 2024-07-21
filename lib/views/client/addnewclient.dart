import 'package:flutter/material.dart';
import 'package:privyr/Widgets/Quickaddwidget/Quick.dart';
import 'package:privyr/Widgets/buttonContainer.dart';
import 'package:privyr/style/style.dart';

// ignore: must_be_immutable
class newclient extends StatefulWidget {
  newclient({
    super.key,
    this.displayname,
    this.mobile,
  });
  late final String? displayname;
  final String? mobile;

  @override
  State<newclient> createState() => _newclientState();
}

class _newclientState extends State<newclient> {
  final TextEditingController clientnameController = TextEditingController();
  final TextEditingController mobilenumberController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController DisplaynameController = TextEditingController();
  final TextEditingController NoteController = TextEditingController();

  final scrollController = ScrollController();

  final _formkey = GlobalKey<FormState>();

  String countrycode = "";
  bool isdisplyname = false;

  @override
  void initState() {
    clientnameController.text = widget.displayname ?? "";
    mobilenumberController.text = widget.mobile ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          " Add new client",
          style: quickmesagestyle,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
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
                          textname: "Client Name",
                          controller: clientnameController,
                          hintname: widget.displayname ?? "eg client name",
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
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Display name what your client will see"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          children: [
                            quickmessagedfeilds(
                              textname: "Phone Number",
                              controller: mobilenumberController,
                              hintname: widget.mobile ?? "eg 032366566789",
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
                        height: 180,
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
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
                  ),
                  SizedBox(
                    height: 9,
                  ),
                ],
              ),
            ),
          ),
          buttoncontainer(
            color: Color(0Xff16a2b5),
            text: "SAVE",
            iccon: Icons.save,
            ontap: () {
              if (_formkey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
