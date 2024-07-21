import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? Onchange;
  final Function()? Ontap;
  final String hinttext;
  CustomSearchField({
    this.controller,
    this.Onchange,
    required this.hinttext,
    this.Ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      child: TextFormField(
        onChanged: Onchange,
        onTap: Ontap,
        cursorColor: Colors.teal,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 20,
          ),
          hintText: hinttext,
          hintStyle: const TextStyle(
            fontSize: 13,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.grey.shade300,
          filled: true,
        ),
      ),
    );
  }
}
