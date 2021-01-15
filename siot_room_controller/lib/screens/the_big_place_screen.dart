import 'package:flutter/material.dart';
import '../widgets/draggable_widget.dart';
import 'package:blinking_text/blinking_text.dart';
import 'home_screen.dart';

class TheBigPlaceScreen extends StatefulWidget {
  static const routeName = "/the-big-place";

  @override
  _TheBigPlaceScreenState createState() => _TheBigPlaceScreenState();
}

class _TheBigPlaceScreenState extends State<TheBigPlaceScreen> {
  int selectedLayout = 0;

  bool projectorOne = false;
  String projectorOneSource = "";
  double projectorOneVolume = 50;

  bool projectorTwo = true;
  String projectorTwoSource = "";
  double projectorTwoVolume = 70;

  bool projectorThree = true;
  String projectorThreeSource = "";
  double projectorThreeVolume = 20;

  String screenOneText = "";
  String screenTwoText = "";
  String screenThreeText = "";

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ALERT'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text('Alert'),
                Text('Are you sure you want to exit The Big Place?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                // Navigator.of(context).pushNamed("/");
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
            ),
          ],
        );
      },
    );
  }

  void refresh() {
    setState(() {});
  }

  Widget screen(screenNum, screenSize, screenMargin) {
    double projectorVolume;
    bool projectorState;
    String projectorSource;
    if (screenNum == 1) {
      projectorState = projectorOne;
      projectorSource = projectorOneSource;
      projectorVolume = projectorOneVolume;
    } else if (screenNum == 2) {
      projectorState = projectorTwo;
      projectorSource = projectorTwoSource;
      projectorVolume = projectorTwoVolume;
    } else if (screenNum == 3) {
      projectorState = projectorThree;
      projectorSource = projectorThreeSource;
      projectorVolume = projectorThreeVolume;
    }

    return Container(
      width: MediaQuery.of(context).size.width * screenSize,
      color: Color(0xE6D9D9D9),
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  child: Align(
                    alignment: Alignment.center,
                    child: buildDragTarget(screenNum),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  alignment: Alignment.center,
                  child: Text(
                    "Screen $screenNum",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 32,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              alignment: Alignment.center,
              child: projectorState == false || projectorSource == ""
                  ? Icon(
                      Icons.volume_off,
                      size: 40,
                      color: Colors.redAccent,
                    )
                  : Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (screenNum == 1) {
                                if (projectorOneVolume >= 10) {
                                  projectorOneVolume -= 10;
                                }
                              } else if (screenNum == 2) {
                                if (projectorTwoVolume >= 10) {
                                  projectorTwoVolume -= 10;
                                }
                              } else if (screenNum == 3) {
                                if (projectorThreeVolume >= 10) {
                                  projectorThreeVolume -= 10;
                                }
                              }
                            });
                          },
                          child: Icon(
                            Icons.volume_down,
                            size: 40,
                          ),
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.width * screenSize -
                                  80,
                          child: SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 10,
                              activeTrackColor: Theme.of(context).primaryColor,
                            ),
                            child: Slider(
                              value: projectorVolume,
                              min: 0,
                              max: 100,
                              divisions: 10,
                              label: projectorVolume.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  if (screenNum == 1) {
                                    projectorOneVolume = value;
                                  }
                                  if (screenNum == 2) {
                                    projectorTwoVolume = value;
                                  }
                                  if (screenNum == 3) {
                                    projectorThreeVolume = value;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (screenNum == 1) {
                                if (projectorOneVolume <= 90) {
                                  projectorOneVolume += 10;
                                }
                              } else if (screenNum == 2) {
                                if (projectorTwoVolume <= 90) {
                                  projectorTwoVolume += 10;
                                }
                              } else if (screenNum == 3) {
                                if (projectorThreeVolume <= 90) {
                                  projectorThreeVolume += 10;
                                }
                              }
                            });
                          },
                          child: Icon(
                            Icons.volume_up,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget returnScreens(screenSize, screenMargin) {
    if (selectedLayout == 1) {
      return screen(1, screenSize, screenMargin);
    } else if (selectedLayout == 2) {
      return Row(
        children: [
          screen(1, screenSize, screenMargin),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          screen(2, screenSize, screenMargin),
        ],
      );
    } else if (selectedLayout == 3) {
      return Row(
        children: [
          screen(1, screenSize, screenMargin),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.025,
          ),
          screen(2, screenSize, screenMargin),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.025,
          ),
          screen(3, screenSize, screenMargin),
        ],
      );
    }
  }

  Widget buildDragTarget(screen) {
    String screenText;
    String imagePath;
    if (screen == 1) {
      screenText = screenOneText;
    } else if (screen == 2) {
      screenText = screenTwoText;
    } else {
      screenText = screenThreeText;
    }

    if (screenText.contains("HDMI")) {
      imagePath = "assets/images/laptop.png";
    } else if (screenText.contains("TV")) {
      imagePath = "assets/images/tv_tuner.png";
    } else {
      imagePath = "assets/images/wireless.png";
    }

    return DragTarget(
      builder: (BuildContext bc, List<String> incoming, List rejected) {
        String projectorSource;
        String projectorNumber;
        bool projector;

        if (screen == 1) {
          projectorSource = projectorOneSource;
          projectorNumber = "Projector 1";
          projector = projectorOne;
        } else if (screen == 2) {
          projectorSource = projectorTwoSource;
          projectorNumber = "Projector 2";
          projector = projectorTwo;
        } else if (screen == 3) {
          projectorSource = projectorThreeSource;
          projectorNumber = "Projector 3";
          projector = projectorThree;
        }

        if (projectorSource == "") {
          return Container(
            height: MediaQuery.of(context).size.height * 0.40,
            child: Center(
              child: projector == false
                  ? Text(
                      "$projectorNumber is switched off",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    )
                  : Text(
                      "Select a Source",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
            ),
          );
        } else if (projectorSource == "off") {
          return Container(
            height: MediaQuery.of(context).size.height * 0.40,
            child: Center(
              child: BlinkText(
                "$projectorNumber is switched off",
                style: TextStyle(
                  fontSize: 24,
                ),
                beginColor: Colors.black,
                endColor: Colors.red,
                times: 2,
                duration: Duration(milliseconds: 500),
              ),
            ),
          );
        } else {
          return Container(
            height: MediaQuery.of(context).size.height * 0.40,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 12,
                  top: 12,
                ),
                child: Align(
                  alignment: FractionalOffset.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 40,
                    ),
                    onPressed: () {
                      setState(() {
                        if (screen == 1) {
                          projectorOneSource = "";
                        } else if (screen == 2) {
                          projectorTwoSource = "";
                        } else if (screen == 3) {
                          projectorThreeSource = "";
                        }
                      });
                    },
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: double.infinity,
                  color: Color(0x80000000),
                  child: Center(
                    child: Text(
                      screenText,
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
          );
        }
      },
      onWillAccept: (data) => true,
      onAccept: (data) {
        if (screen == 1) {
          if (projectorOne == false) {
            setState(() {
              projectorOneSource = "off";
              print("Projector off");
            });
          } else {
            setState(() {
              setState(() {
                projectorOneSource = "placed";
                screenOneText = "$data";
              });
            });
            // Projector is open.
            // if (data == "HDMI 1") {
            //   setState(() {
            //     projectorOneSource = "placed";
            //     print("Updated");
            //   });
            // } else {
            //   setState(() {
            //     projectorOneSource = "wrong";
            //     // print("no Updated");
            //     print("$projectorOneSource LOL");
            //   });
            // }
          }
          // setState(() {
          //   screenOneText = "$data";
          // });
        } else if (screen == 2) {
          if (projectorTwo == false) {
            setState(() {
              projectorTwoSource = "off";
              // print("Projector off");
            });
          } else {
            setState(() {
              setState(() {
                projectorTwoSource = "placed";
                screenTwoText = "$data";
              });
            });
          }
        } else if (screen == 3) {
          if (projectorThree == false) {
            setState(() {
              projectorThreeSource = "off";
              // print("Projector off");
            });
          } else {
            setState(() {
              setState(() {
                projectorThreeSource = "placed";
                screenThreeText = "$data";
              });
            });
          }
        }
      },
    );
  }

  Widget middleContent() {
    double screenSize;
    double screenMargin;
    if (selectedLayout == 1) {
      screenSize = 0.50;
      screenMargin = 0.25;
    } else if (selectedLayout == 2) {
      screenSize = 0.425;
      screenMargin = 0.05;
    } else if (selectedLayout == 3) {
      screenSize = 0.30;
      screenMargin = 0.025;
    }
    if (selectedLayout == 0) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.60,
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height * 0.595,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.005,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Draggable<String>(
                    data: "HDMI 1",
                    child: DraggableWidget(0x80000000, "HDMI 1"),
                    feedback: DraggableWidget(0x80007C89, "HDMI 1"),
                    childWhenDragging: DraggableWidget(0x80000000, "HDMI 1"),
                  ),
                ),
                Container(
                  child: Draggable<String>(
                    data: "HDMI 2",
                    child: DraggableWidget(0x80000000, "HDMI 2"),
                    feedback: DraggableWidget(0x80007C89, "HDMI 2"),
                    childWhenDragging: DraggableWidget(0x80000000, "HDMI 2"),
                  ),
                ),
                Container(
                  child: Draggable<String>(
                    data: "HDMI 3",
                    child: DraggableWidget(0x80000000, "HDMI 3"),
                    feedback: DraggableWidget(0x80007C89, "HDMI 3"),
                    childWhenDragging: DraggableWidget(0x80000000, "HDMI 3"),
                  ),
                ),
                Container(
                  child: Draggable<String>(
                    data: "HDMI 4",
                    child: DraggableWidget(0x80000000, "HDMI 4"),
                    feedback: DraggableWidget(0x80007C89, "HDMI 4"),
                    childWhenDragging: DraggableWidget(0x80000000, "HDMI 4"),
                  ),
                ),
                Container(
                  child: Draggable<String>(
                    data: "TV Tuner",
                    child: DraggableWidget(0x80000000, "TV Tuner"),
                    feedback: DraggableWidget(0x80007C89, "TV Tuner"),
                    childWhenDragging: DraggableWidget(0x80000000, "TV Tuner"),
                  ),
                ),
                Container(
                  child: Draggable<String>(
                    data: "Wireless",
                    child: DraggableWidget(0x80000000, "Wireless"),
                    feedback: DraggableWidget(0x80007C89, "Wireless"),
                    childWhenDragging: DraggableWidget(0x80000000, "Wireless"),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.025,
                bottom: MediaQuery.of(context).size.height * 0.025,
                left: MediaQuery.of(context).size.width * screenMargin,
                right: MediaQuery.of(context).size.width * screenMargin,
              ),
              child: returnScreens(screenSize, screenMargin),
            )
          ],
        ),
      );
    }
  }

  Widget projectorWidget(name, state) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3333,
      color: state == true ? Color(0xB3007C89) : Color(0xB3000000),
      child: Center(
        child: Text(
          "$name",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget layoutWidget(selectedLayoutNumber, imgPathStr) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3333,
      // color: Colors.yellow,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("$imgPathStr"),
        ),
      ),
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: double.infinity,
          color: selectedLayout == selectedLayoutNumber
              ? Color(0xB3007C89)
              : Color(
                  (0xB3000000),
                ),
          child: Center(
            child: Text(
              "Layout $selectedLayoutNumber",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The Big Place",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => _showMyDialog(),
        ),
        actions: [
          // Settings
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return new Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          width: double.infinity,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (projectorOne == true) {
                                      projectorOne = false;
                                    } else {
                                      projectorOne = true;
                                    }
                                    refresh();
                                    projectorOneSource = "";
                                  });
                                },
                                child: projectorWidget(
                                    "Projector 1", projectorOne),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (projectorTwo == true) {
                                      projectorTwo = false;
                                    } else {
                                      projectorTwo = true;
                                    }
                                    refresh();
                                    projectorTwoSource = "";
                                  });
                                },
                                child: projectorWidget(
                                    "Projector 2", projectorTwo),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (projectorThree == true) {
                                      projectorThree = false;
                                    } else {
                                      projectorThree = true;
                                    }
                                    refresh();
                                    projectorThreeSource = "";
                                  });
                                },
                                child: projectorWidget(
                                    "Projector 3", projectorThree),
                              ),
                            ],
                          ),
                        );
                      });
                    });
              }),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/images/the_big_place.png",
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              // Heading
              color: selectedLayout == 0
                  ? Color(0xB3000000)
                  : Color(
                      (0xB3007C89),
                    ),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Center(
                child: Text(
                  selectedLayout == 0
                      ? "Select a Layout"
                      : "Drag Source to Screen",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            middleContent(), // TO BE CONT.
            Expanded(
              // Bottom Tab
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        selectedLayout = 1;
                        if (projectorOneSource == "off") {
                          projectorOneSource = "";
                        }
                      }),
                      child: layoutWidget(1, "assets/images/layout_one.png"),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        selectedLayout = 2;
                        if (projectorOneSource == "off") {
                          projectorOneSource = "";
                        }
                        if (projectorTwoSource == "off") {
                          projectorTwoSource = "";
                        }
                      }),
                      child: layoutWidget(2, "assets/images/layout_two.png"),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        selectedLayout = 3;
                        if (projectorOneSource == "off") {
                          projectorOneSource = "";
                        }
                        if (projectorTwoSource == "off") {
                          projectorTwoSource = "";
                        }
                        if (projectorThreeSource == "off") {
                          projectorThreeSource = "";
                        }
                      }),
                      child: layoutWidget(3, "assets/images/layout_three.png"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
