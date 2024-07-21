import 'package:flutter/material.dart';
import 'package:privyr/Widgets/InviteTeam/myObjects.dart';
import 'package:privyr/Widgets/buttonContainer.dart';
import 'package:privyr/style/style.dart';

class Foldername extends StatefulWidget {
  Foldername({
    required this.foldercontroller,
    required this.fold,
    required this.onDelete,
    required this.updateFolder,
  });

  final String foldercontroller;
  final List<String> fold;
  final Function(String) onDelete;
  final Function(String, String) updateFolder;

  @override
  State<Foldername> createState() => _FoldernameState();
}

class _FoldernameState extends State<Foldername> {
  TextEditingController edittingcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(widget.foldercontroller),
        actions: [
          TextButton(
            child: Text(
              "Options",
              style: AppbarStyle,
            ),
            onPressed: () {
              showModalBottomSheet(
                shape: Border(),
                context: context,
                builder: (context) {
                  return Container(
                    height: 150,
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
                          onTap: () {
                            edittingcontroller.text = widget.foldercontroller;
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 350,
                                  width: double.infinity,
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
                                          controller: edittingcontroller,
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      Spacer(),
                                      buttoncontainer(
                                        text: "Save",
                                        ontap: () {
                                          widget.updateFolder(
                                              widget.foldercontroller,
                                              edittingcontroller.text);
                                          
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: custombottomsheet(
                            icon: Icons.edit,
                            text: "Edit Folder",
                          ),
                        ),
                        Divider(),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            widget.onDelete(widget.foldercontroller);
                            Navigator.pop(context); 
                            Navigator.pop(
                                context); 
                          },
                          child: custombottomsheet(
                            icon: Icons.delete,
                            text: "Delete Folder",
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
