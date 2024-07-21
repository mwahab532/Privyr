import 'package:flutter/material.dart';
import 'package:privyr/Provider/contentview_provider.dart';
import 'package:privyr/Widgets/customfeild.dart';
import 'package:privyr/views/Content/Files.dart';
import 'package:privyr/views/Content/Messages.dart';
import 'package:privyr/views/Content/Page.dart';
import 'package:provider/provider.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    final contentstate = Provider.of<contentviewprovider>(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomSearchField(
            hinttext: contentstate.hintedText,
            controller: contentstate.currentcontroller,
          ),
          bottom: Tab(
            child: Row(
              children: [
                Tab(
                  child: TextButton(
                    child: Text(
                      "Message",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      contentstate.changeview("Message", "Search Messages....");
                    },
                  ),
                ),
                Tab(
                  child: TextButton(
                    child: Text(
                      "Files",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      contentstate.changeview("File", "Search files");
                    },
                  ),
                ),
                Tab(
                  child: TextButton(
                    child: Text(
                      "Page",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      contentstate.changeview("Page", "Search Pages.");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: getview(contentstate.ContentCurrentview,contentstate.currentcontroller));
  }

  Widget getview(String view,TextEditingController controller) {
    switch (view) {
      case "File":
        return File();
      case "Page":
        return Pages();
      default:
        return Message(controller: controller,);
    }
  }
}
