import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  static String route = '/about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Developer",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w200,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Mohannad Alnono",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "GitHub",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w200,
                fontStyle: FontStyle.italic,
              ),
            ),
            Image(
              image: ExactAssetImage('assets/images/qrCode.png'),
            ),
            Positioned(
              child: Text(
                "Version 1.1.2",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app_rounded),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
