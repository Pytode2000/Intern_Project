import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:blinking_text/blinking_text.dart';
import 'home_screen.dart';

class Townhall extends StatefulWidget {
  static const routeName = "/townhall";

  @override
  _TownhallState createState() => _TownhallState();
}

class _TownhallState extends State<Townhall> {
  @override
  Widget build(BuildContext context) {
    bool securityCheck = false;

    securityDialog() {
      if (securityCheck == false) {
        return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            String password = "";
            bool wrongPassword = false;
            return StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                // title: Center(child: Text('')),
                contentPadding: EdgeInsets.all(0.0),
                content: Container(
                  // width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    children: [
                      Container(
                        color: Color(0xff007C89),
                        height: 50,
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(HomeScreen.routeName);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(width: 1, color: Colors.blueGrey),
                          ),
                        ),
                        child: Text(
                          password,
                          style: TextStyle(
                            fontSize: 24,
                            letterSpacing: 5,
                          ),
                        ),
                      ),
                      Container(
                        child: NumericKeyboard(
                            onKeyboardTap: (value) {
                              setState(() {
                                password = password + value;
                              });
                            },
                            textColor: Color(0xff007C89),
                            rightButtonFn: () {
                              setState(() {
                                if (password.length > 0) {
                                  password = password.substring(
                                      0, password.length - 1);
                                }
                              });
                            },
                            rightIcon: Icon(
                              Icons.backspace,
                              color: Colors.blueGrey,
                            ),
                            leftButtonFn: () {
                              if (password == "4272") {
                                Navigator.pop(context);
                                securityCheck = true;
                              } else {
                                setState(() {
                                  wrongPassword = true;
                                });
                                Future.delayed(
                                    const Duration(milliseconds: 5000), () {
                                  setState(() {
                                    wrongPassword = false;
                                  });
                                });
                              }
                            },
                            leftIcon: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                      ),
                      wrongPassword == true
                          ? Container(
                              child: BlinkText(
                                "Wrong password! Please try again.",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                beginColor: Colors.black,
                                endColor: Colors.red,
                                times: 3,
                                duration: Duration(milliseconds: 500),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              );
            });
          },
        );
      }
    }

    Future.delayed(Duration.zero, () async {
      securityDialog();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Townhall",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/images/townhall.png",
            ),
          ),
        ),
      ),
    );
  }
}
