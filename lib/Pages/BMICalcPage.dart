import 'dart:async';

import 'package:bmicalculator/Const/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                Expanded(child: _tempCard("GENDER")),
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

Widget _bmiResults(BuildContext context) {
  return Hero(
      tag: 'bmiScreen',
      child: Container(
        child: Text(
          "BMI RESULTS : ",
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Dosis',
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 5,
        alignment: Alignment.center,
        color: Color(0xFF4E5A86),
      ));
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

class _stuff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("STate"),
    );
  }
}

class weightCard extends StatefulWidget {
  @override
  _weightCardState createState() => _weightCardState();
}

class _weightCardState extends State<weightCard> {
  int weight = 0;
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
          Flexible(
              flex: 1,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(120.0)),
                onPressed: () {
                  setState(() {
                    var currWeight = weight + 1;
                    if (currWeight < 1000) {
                      weight = currWeight;
                      _controller.text = currWeight.toString();
                    }
                  });
                },
                child: Icon(Icons.arrow_drop_up),
              )),
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
          Flexible(
              flex: 1,
              child: FlatButton(
                onPressed: () {
                  var currWeight = weight - 1;
                  if (currWeight >= 0) {
                    weight = currWeight;
                    _controller.text = currWeight.toString();
                  }
                },
                onLongPress: () {
                  Timer.periodic(Duration(milliseconds: 1000), (timer) {
                    setState(() {
                      var currWeight = weight - 1;
                      if (currWeight >= 0) {
                        weight = currWeight;
                        _controller.text = currWeight.toString();
                      }
                    });
                  });
                },
                child: Icon(Icons.arrow_drop_down),
              ))
        ],
      ),
    );
  }
}

Widget _WeigthCard(String label) {
  return Card(
    shadowColor: mainColor(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Flexible(
            flex: 1,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_drop_up),
            )),
        Flexible(
          flex: 4,
          child: TextField(
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
        Flexible(
            flex: 1,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_drop_down),
            ))
      ],
    ),
  );
}

Widget _HeightCard(String label) {
  return Container(
    margin: EdgeInsets.all(10),
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black38,
          blurRadius: 10.0,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: "WEIGTH",
          hintStyle: TextStyle(fontSize: 25),
          counterText: "",
          border: InputBorder.none),
      maxLength: 3,
      keyboardType: TextInputType.phone,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
      ],
      style: TextStyle(color: mainColor(), fontSize: 35, fontFamily: 'Dosis'),
    ),
  );
}

Widget _bmiInputs(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.height,
    width: double.infinity,
    child: Text("Inputs"),
    color: Colors.green,
  );
}

Widget _tempCard(String label) {
  return Card(
    child: Container(
      alignment: Alignment.center,
      child: Text(label),
    ),
  );
}
