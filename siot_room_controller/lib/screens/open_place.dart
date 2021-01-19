import 'package:flutter/material.dart';

class OpenPlace extends StatelessWidget {
  static const routeName = "/open-place";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Open Place",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/images/open_place.png",
            ),
          ),
        ),
      ),
    );
  }
}
