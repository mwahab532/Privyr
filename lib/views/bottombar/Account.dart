import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:privyr/Widgets/settings/accountNameheader.dart';

import 'package:privyr/Widgets/settings/textcontainer.dart';
import 'package:privyr/style/style.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Future<void> handleSignout() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            height: 80,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  "Account",
                  style: textstyle,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          accountheader(),
          SizedBox(
            height: 10,
          ),
          Aligntext(
            headling: "Account Prefences",
          ),
          SizedBox(
            height: 8,
          ),
          prfcontainer(),
          SizedBox(
            height: 8,
          ),
          Aligntext(headling: "Customer Support "),
          SizedBox(
            height: 8,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                settingsOption(
                  title: "User Guide",
                  onpressed: () {},
                ),
                Divider(), // Divider after "User Guide"
                settingsOption(
                  title: "Chat with Us",
                  onpressed: () {},
                ),
              ],
            ),
          ),
          Aligntext(headling: "Invite Friends"),
          SizedBox(height: 12),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: [
                settingsOption(
                  title: "Get Free credits",
                  onpressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          GestureDetector(
            onTap: () {
              handleSignout();
            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
