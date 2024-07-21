import 'package:flutter/material.dart';
import 'package:privyr/style/style.dart';
import 'package:privyr/views/client/InviteTeam.dart';

class Team extends StatelessWidget {
  const Team({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Wellcome to your team"),
            SizedBox(
              height: 10,
            ),
            TextButton(
              child: Text(
                "Invite Team",
                style: textbuttonstyle,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InviteTeam(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
