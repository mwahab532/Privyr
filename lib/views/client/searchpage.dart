import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:privyr/Provider/contect_provider.dart';
import 'package:privyr/style/style.dart';
import 'package:privyr/views/client/addnewclient.dart';
import 'package:provider/provider.dart';
import '../../Widgets/customfeild.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Contact> contacts = [];
  List<Contact> filltercontacts = [];
  var searchController = TextEditingController();
  bool isloading = true;



  void fetchcontect() async {
    List<Contact> fcontacts = await ContactsService.getContacts();
    setState(() {
      contacts = fcontacts;
      filltercontacts = fcontacts;
      isloading = false;
    });
  }

    void filltercontect() {
    final contacts =
        Provider.of<ContactProvider>(context, listen: false).contacts;
    if (searchController.text.isEmpty) {
      setState(() {
        filltercontacts = contacts;
      });
      return;
    }

    List<Contact> _contects = [];
    _contects.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contects.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String contactName = contact.displayName?.toLowerCase() ?? "";
        return contactName.contains(searchTerm);
      });
    }
    setState(() {
      filltercontacts = _contects;
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
        automaticallyImplyLeading: false,
        title: Container(
          color: Colors.transparent,
          height: 43,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Icon(Icons.arrow_back, color: Colors.black)),
              ),
              SizedBox(width: 8),
              Expanded(
                child: CustomSearchField(
                  hinttext: "Search clients & phonebook...",
                  controller: searchController,
                ),
              ),
            ],
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
                Visibility(
                  visible: searchController.text.isNotEmpty &&
                      filltercontacts.isNotEmpty,
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: filltercontacts.length,
                      itemBuilder: (context, index) {
                        Contact contacts = filltercontacts[index];
                        return ListTile(
                          leading: Icon(Icons.person),
                          title: Text(contacts.displayName ?? ""),
                          subtitle: Text(contacts.phones!.isNotEmpty
                              ? contacts.phones!.first.value ?? ""
                              : ""),
                          trailing: Text(
                            "Use",
                            style: searchcontectstyle,
                          ),
                          onTap: () {
                            final route = MaterialPageRoute(
                              builder: (context) => newclient(
                                displayname: contacts.displayName ?? "",
                                mobile: contacts.phones!.isNotEmpty
                                    ? contacts.phones!.first.value ?? ""
                                    : "",
                              ),
                            );
                            Navigator.push(context, route);
                            
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
