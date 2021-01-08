import 'package:flutter/material.dart';
import 'package:blinking_text/blinking_text.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Center(
          child: Image(
            image: AssetImage(
              "assets/images/govtech.gif",
            ),
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            height: 150,
            child: BlinkText(
              "<< Touch anywhere to begin >>",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 42,
              ),
              beginColor: Theme.of(context).primaryColor,
              endColor: Colors.green,
              duration: Duration(milliseconds: 2000),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("/home");
              // Can add additional stuff here, such as switching on the hardware.
            },
          ),
        ),
      ]),
    );
  }
}
