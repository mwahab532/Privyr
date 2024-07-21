import 'package:flutter/material.dart';
import 'package:privyr/Widgets/buttonContainer.dart';
import 'package:privyr/style/style.dart';
import 'package:privyr/views/Content/FName.dart';

class createfolder extends StatefulWidget {
  const createfolder({super.key});

  @override
  State<createfolder> createState() => _createfolderState();
}

class _createfolderState extends State<createfolder> {
  TextEditingController foldercontroller = TextEditingController();

  List<String> folder = [];

  void deleteFolder(String folderName) {
    setState(() {
      folder.remove(folderName);
    });
  }

  void updateFolder(String oldname, String newname) {
    setState(() {
      int index = folder.indexOf(oldname);
      if (index != -1) {
        folder[index] = newname;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Create Folders"),
      ),
      body: ListView.builder(
        itemCount: folder.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
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
                      folder[index],
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
                          MaterialPageRoute(
                            builder: (context) => Foldername(
                              foldercontroller: folder[index],
                              fold: folder,
                              onDelete: deleteFolder,
                              updateFolder: updateFolder,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xFF16a2b5),
        child: Icon(
          Icons.create_new_folder,
          color: Colors.white,
        ),
        onPressed: () {
          sheet(context);
        },
      ),
    );
  }

  Widget? sheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Flexible(
          child: Container(
            height: 250,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.grey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Create Folder",
                      style: bottomsheettextstyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    maxLines: 5,
                    minLines: 1,
                    controller: foldercontroller,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Enter folder name...",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                ),
                Spacer(),
                buttoncontainer(
                  iccon: Icons.done,
                  text: "Create Folder",
                  ontap: () {
                    setState(
                      () {
                        folder.add(foldercontroller.text);
                      },
                    );
                    foldercontroller.clear();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
    return null;
  }
}
