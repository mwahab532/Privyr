import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_file/open_file.dart';
import 'package:privyr/style/style.dart';
import 'package:privyr/views/Content/filefolder.dart';

class File extends StatefulWidget {
  const File({super.key});

  @override
  State<File> createState() => _FileState();
}

class _FileState extends State<File> {
  List<PlatformFile> filesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          SizedBox(height: 8),
          Container(
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
                  SizedBox(width: 5),
                  Text(
                    "FOLDERS",
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
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  Filefolder(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filesList.length,
              itemBuilder: (context, index) {
                final file = filesList[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(FontAwesomeIcons.solidFilePdf),
                      title: Text(
                        file.name,
                        style: Folderstyle,
                      ),
                      subtitle: Text(
                        '${file.extension}',
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                      onTap: () => openFile(file),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xFF16a2b5),
        onPressed: () async {
          final result = await FilePicker.platform.pickFiles();
          if (result == null) return;
          final File = result.files.first;
          setState(() {
            filesList.add(File);
          });
        },
        child: Icon(
          Icons.upload,
          color: Colors.white,
        ),
      ).animate().scaleXY(),
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
