import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  final int colour;
  DraggableWidget(this.colour);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.10,
        height: MediaQuery.of(context).size.height * 0.10,

        // color: Colors.blue,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Stack(children: [
          Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.laptop,
              size: 75,
              color: Colors.green,
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
                  )),
              child: Center(
                child: Text(
                  "HDMI 1",
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
