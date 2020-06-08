import 'dart:async';

import 'package:bmicalculator/Const/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

int weight = 0;
String gender = gend[0];

class BMIPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BMIWidget());
  }
}

class BMIWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(child: _tempCard("Hello 1")),
            Expanded(
                child: Column(
              children: <Widget>[
                Expanded(child: genderCard()),
                Expanded(child: weightCard())
              ],
            ))
          ],
        )),
        _bmiCalculateBtn(context)
      ],
    ));
  }
}

Widget _bmiCalculateBtn(BuildContext context) {
  return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 5,
      alignment: Alignment.center,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
                flex: 3,
                child: Hero(
                    tag: 'bmiScreen',
                    child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(15, 15, 20, 15),
                        color: Color(0xFF4E5A86),
                        textColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        onPressed: () {},
                        child: const Text(
                          'Calculate BMI',
                          style: TextStyle(fontSize: 30),
                        )))),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Flexible(
                flex: 1,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("STUFF"),
                ))
          ]));
}

class weightCard extends StatefulWidget {
  @override
  _weightCardState createState() => _weightCardState();
}

class _weightCardState extends State<weightCard> {
  var _controller = TextEditingController();
  Timer timer;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: mainColor(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          weightBtn(_controller, true),
          Flexible(
            flex: 4,
            child: TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: "WEIGHT",
                  hintStyle: TextStyle(fontSize: 25),
                  counterText: "",
                  border: InputBorder.none),
              maxLength: 3,
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly,
              ],
              style: TextStyle(
                  color: mainColor(), fontSize: 35, fontFamily: 'Dosis'),
            ),
          ),
//          setWeight(_controller, false)
          weightBtn(_controller, false),
        ],
      ),
    );
  }
}

//WEIGHT STUFF
//THIS
//IS
//FOR
//SEPERATION

class weightBtn extends StatefulWidget {
  TextEditingController _controller;
  bool isIncreaseWeight;

  weightBtn(this._controller, this.isIncreaseWeight);

  @override
  _weightBtnState createState() =>
      _weightBtnState(_controller, isIncreaseWeight);
}

class _weightBtnState extends State<weightBtn> {
  Timer timer;
  TextEditingController _controller;
  bool isIncreaseWeight;

  _weightBtnState(this._controller, this.isIncreaseWeight);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (TapDownDetails details) {
          timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
            setState(() {
              var calcWeight;
              if (isIncreaseWeight) {
                calcWeight = incrementWeight();
              } else {
                calcWeight = decreaseWeight();
              }
              _controller.text = calcWeight.toString();
            });
          });
        },
        onTapCancel: () {
          timer.cancel();
        },
        onTapUp: (TapUpDetails details) {
          timer.cancel();
        },
        child: RaisedButton(
          color: subColor(),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
          onPressed: () {
            var calcWeight;
            if (isIncreaseWeight) {
              calcWeight = incrementWeight();
            } else {
              calcWeight = decreaseWeight();
            }
            _controller.text = calcWeight.toString();
          },
          child: getWeightIcon(isIncreaseWeight),
        ));
  }
}

Widget getWeightIcon(bool isIncreaseWeight) {
  if (isIncreaseWeight) {
    return Icon(
      Icons.arrow_drop_up,
      color: Colors.white,
      size: 30,
    );
  } else {
    return Icon(
      Icons.arrow_drop_down,
      color: Colors.white,
      size: 30,
    );
  }
}

int decreaseWeight() {
  var currWeight = weight - 1;
  if (currWeight >= 0) {
    weight = currWeight;
  }
  return weight;
}

int incrementWeight() {
  var currWeight = weight + 1;
  if (currWeight < 1000) {
    weight = currWeight;
  }
  return weight;
}




//GENDER STUFF
//THIS
//IS
//FOR
//SEPERATION

class genderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 50,
      onSelectedItemChanged: (int index) {
        switch (index) {
          case 0:
            gender = gend[0];
            print(gender);
            break;
          case 1:
            gender = gend[1];
            print(gender);
            break;
          default:
            gender = gend[2];
            print(gender);
            break;
        }
      },
      children: <Widget>[
        Text(
          gend[0],
          style:
              TextStyle(color: mainColor(), fontSize: 30, fontFamily: 'Dosis'),
        ),
        Text(
          gend[1],
          style:
              TextStyle(color: mainColor(), fontSize: 30, fontFamily: 'Dosis'),
        ),
        Text(
          gend[2],
          style:
              TextStyle(color: mainColor(), fontSize: 30, fontFamily: 'Dosis'),
        )
      ],
    );
  }
}

Widget _tempCard(String label) {
  return Card(
    child: Container(
      alignment: Alignment.center,
      child: Text(label),
    ),
  );
}
