import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.power_settings_new,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Control Room",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.40,
            color: Colors.red,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.40,
            color: Colors.blue,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.40,
            color: Colors.green,
          ),
        ]),
      ),
    );
  }
}
