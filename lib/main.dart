import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Quizzed(),
    );
  }
}

class Quizzed extends StatefulWidget {
  @override
  _QuizzedState createState() => _QuizzedState();
}

class _QuizzedState extends State<Quizzed> {
  bool depends = true;
  List<Widget> iconList = [];
  int rightAns = 0;
  String message = "Play Again...!!!";
  QuizBrain qb = QuizBrain();

  void analyzeAnswer(bool givenAnswer) {
    print(rightAns);
    setState(() {
      if (givenAnswer == qb.getQsnAnswer()) {
        iconList.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        ++rightAns;
      } else {
        iconList.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      qb.nextQsnNumber();
    });
    if (iconList.length > 4) {
      switch (rightAns) {
        case 0:
          message = "Dumb";
          break;
        case 1:
          message = "Too Bad";
          break;
        case 2:
          message = "Bad";
          break;
        case 3:
          message = "Good";
          break;
        case 4:
          message = "Very Good";
          break;
        case 5:
          message = "BINGO...";
      }
      qb.answeredQsn.clear();
      depends = false;
      Alert(
        context: context,
        title: message,
        desc: "Play again to learn new things...",
        content: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                children: iconList,
              ),
            ),
            Expanded(
              child: Text((rightAns * 20).toString() + "%"),
            )
          ],
        )),
        closeFunction: () {
          setState(() {
            rightAns = 0;
            depends = true;
            iconList.clear();
          });
        },
        buttons: [
          DialogButton(
            child: Text("Play Again"),
            color: Colors.green,
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                rightAns = 0;
                depends = true;
                iconList.clear();
              });
            },
          ),
          DialogButton(
            child: Text("Exit"),
            color: Colors.red,
            onPressed: () => exit(0),
          )
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: !depends,
        child: FloatingActionButton.extended(
          label: Text("Again"),
          icon: Icon(Icons.refresh),
          focusElevation: 0.0,
          hoverElevation: 0.0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.redAccent,
          elevation: 5.0,
          onPressed: () {
            setState(() {
              rightAns = 0;
              depends = true;
              iconList.clear();
            });
          },
        ),
      ),
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Visibility(
                visible: depends,
                child: Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        qb.getQsnString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: depends,
                child: Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FlatButton(
                            color: Colors.green,
                            child: Text(
                              'Yes',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => analyzeAnswer(true),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FlatButton(
                            color: Colors.red,
                            child: Text(
                              'No',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () => analyzeAnswer(false),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: iconList,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
