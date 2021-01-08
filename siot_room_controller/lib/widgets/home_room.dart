import 'package:flutter/material.dart';
import 'package:blinking_text/blinking_text.dart';

class HomeRoom extends StatelessWidget {

  final String assetImagePath;
  final String overlayText;
  final String route;

  HomeRoom(this.assetImagePath, this.overlayText, this.route);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(assetImagePath),
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              height: 150,
              width: double.infinity,
              color: Color(0xB3000000),
              child: Center(
                child: BlinkText(
                  overlayText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                  ),
                  beginColor: Theme.of(context).primaryColor,
                  endColor: Colors.white,
                  duration: Duration(milliseconds: 2000),
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(route);
              },
            ),
          ),
        ],
      ),
    );
  }
}
