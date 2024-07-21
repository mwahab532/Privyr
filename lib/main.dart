import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:privyr/Auth/authservices.dart';
import 'package:privyr/Provider/apiprovider.dart';
import 'package:privyr/Provider/contect_provider.dart';
import 'package:privyr/Provider/contentview_provider.dart';
import 'package:privyr/Provider/currentviewprovider.dart';
import 'package:privyr/Provider/noteprovider.dart';
import 'package:privyr/Provider/textprovider.dart';
import 'package:privyr/firebase_options.dart';
//import 'package:privyr/views/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(privyr());
}

class privyr extends StatelessWidget {
  const privyr({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => apiprovider()),
        ChangeNotifierProvider(create: (context) => Changetextprovider()),
        ChangeNotifierProvider(create: (context) => currentview()),
        ChangeNotifierProvider(create: (context) => contentviewprovider()),
        ChangeNotifierProvider(create: (context) => ContactProvider()),
        ChangeNotifierProvider(create: (context) => NoteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Privyr",
        home: Authpage(),
      ),
    );
  }
}
    // Color(0Xff16a2b5).withOpacity(0.5),
    //                 Color(0xffbf67f2),
      // begin: Alignment.centerLeft,
      //             end: Alignment.bottomCenter,
     //  Color(0Xff16a2b5)