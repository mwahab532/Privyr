import 'package:flutter/material.dart';
import 'package:privyr/style/style.dart';

// ignore: must_be_immutable
class buttoncontainer extends StatelessWidget {
  buttoncontainer(
      {required this.text,
      this.ontap,
      this.iccon,
      this.gradient,
      this.color,
    });
  String text;
  IconData? iccon;
  final Function()? ontap;
  final Gradient? gradient;
  final Color? color;
 // final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 50, right: 12, left: 12, bottom: 10),
        child: InkWell(
          onTap: ontap,
          child: Flexible(
            child: Container(
              height: 50,
              decoration: BoxDecoration(gradient: gradient, color: color),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iccon,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    text,
                    style: buttonstyle,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
