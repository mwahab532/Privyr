import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:privyr/views/bottombar/Account.dart';
import 'package:privyr/views/bottombar/Activites.dart';
import 'package:privyr/views/bottombar/FollowUps.dart';
import 'package:privyr/views/bottombar/content.dart';
import 'package:privyr/views/bottombar/clients.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentpage = 0;
  List<Widget> pages = <Widget>[
    Allclients(),
    Content(),
    Activites(),
    FollowUps(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentpage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF16a2b5),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(
                  Icons.groups,
                  size: 30,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffcf5cff), 
                    ),
                  ),
                )
              ],
            ),
            label: "clients",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.file,
            ),
            label: "content",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sort,
            ),
            label: "Activites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.published_with_changes_outlined),
            label: "Follow Ups",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: "Account",
          ),
        ],
        onTap: (int index) {
          setState(() {
            currentpage = index;
          });
        },
        currentIndex: currentpage,
      ),
    );
  }
}
