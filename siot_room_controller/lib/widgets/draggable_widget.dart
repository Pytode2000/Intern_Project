import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  final int colour;
  final String content;
  DraggableWidget(this.colour, this.content);

  @override
  Widget build(BuildContext context) {
    String imagePath;
    int bgColour;
    if (content == "TV Tuner") {
      imagePath = "assets/images/tv_tuner.png";
      bgColour = 0x80FBD2D7;
    } else if (content == "Wireless") {
      imagePath = "assets/images/wireless.png";
      bgColour = 0x4DF6CD8B;
    } else {
      imagePath = "assets/images/laptop.png";
      bgColour = 0x4D4B8B3B;
    }
    return Material(
      color: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.10,
        height: MediaQuery.of(context).size.height * 0.095,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.03333,
          right: MediaQuery.of(context).size.width * 0.03333,
        ),
        // color: Colors.blue,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(bgColour),
        ),
        child: Stack(children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              height: 25,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(colour),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
              ),
              child: Center(
                child: Text(
                  "$content",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
