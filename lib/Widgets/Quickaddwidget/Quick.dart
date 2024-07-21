import 'package:flutter/material.dart';
import 'package:privyr/style/style.dart';

class quickmessagedfeilds extends StatelessWidget {
  const quickmessagedfeilds({
    super.key,
    required this.controller,
    this.textname,
    required this.hintname,
    this.iconButton,
    this.validator,
    this.txt1,
  });
  final String? textname;
  final String hintname;
  final IconButton? iconButton;
  final validator;
  final TextEditingController controller;
  final String? txt1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 90,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              textname ?? "",
              style: clientanamestyle,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        Text(txt1 ?? ""),
        Expanded(
          child: TextFormField(
            textAlign: TextAlign.left,
            validator: validator,
            cursorColor: Colors.black,
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: iconButton,
              border: InputBorder.none,
              hintText: hintname,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ),
        ),
      ],
    );
  }
}
