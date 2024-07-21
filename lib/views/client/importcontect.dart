import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:privyr/Provider/contect_provider.dart';
import 'package:privyr/Widgets/buttonContainer.dart';
import 'package:privyr/Widgets/customfeild.dart';
import 'package:privyr/style/style.dart';
import 'package:provider/provider.dart';

class importcontect extends StatefulWidget {
  const importcontect({super.key});

  @override
  State<importcontect> createState() => _importcontectState();
}

class _importcontectState extends State<importcontect> {
  List<int> selectindex = [];
  List<Contact> filltercontacts = [];
  var searchController = TextEditingController();
  bool isloading = true;

  void filltercontect() {
    final contacts =
        Provider.of<ContactProvider>(context, listen: false).contacts;
    if (searchController.text.isEmpty) {
      setState(() {
        filltercontacts = contacts;
      });
      return;
    }

    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String contactName = contact.displayName?.toLowerCase() ?? "";
        return contactName.contains(searchTerm);
      });
    }
    setState(() {
      filltercontacts = _contacts;
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ContactProvider>(context, listen: false)
        .loadContacts()
        .then((_) {
      setState(() {
        isloading = false;
        filltercontacts =
            Provider.of<ContactProvider>(context, listen: false).contacts;
      });
    });
    searchController.addListener(() {
      filltercontect();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Select Contact to import",
          style: butttonstyle,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
            child: CustomSearchField(
              hinttext: "Search Contacts",
              controller: searchController,
            ),
          ),
        ),
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Column(
              children: [
                Visibility(
                  visible: searchController.text.isNotEmpty &&
                      filltercontacts.isEmpty,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person_off_outlined,
                            size: 50,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "No result found For  ${searchController.text}",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Please cheak your spelling",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: filltercontacts.length,
                    itemBuilder: (context, index) {
                      bool ischeaked = selectindex.contains(index);
                      Contact contact = filltercontacts[index];
                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text(contact.displayName ?? ""),
                        subtitle: Text(contact.phones!.isNotEmpty
                            ? contact.phones!.first.value ?? ""
                            : ""),
                        trailing: Checkbox(
                          shape: CircleBorder(),
                          value: ischeaked,
                          onChanged: (value) {
                            setState(
                              () {
                                if (value == true) {
                                  selectindex.add(index);
                                  filltercontacts.add(contact);
                                } else {
                                  selectindex.remove(index);
                                  filltercontacts.remove(contact);
                                }
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                if (selectindex.isNotEmpty)
                  buttoncontainer(
                    text: "Import Contacts",
                    iccon: Icons.person_add_alt_1,
                  ).animate().shakeX().scaleXY()
              ],
            ),
    );
  }
}
