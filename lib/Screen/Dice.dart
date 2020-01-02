import 'package:flutter/material.dart';
import 'dart:math';

class Diece extends StatefulWidget {
  Diece({Key key}) : super(key: key);

  @override
  _DieceState createState() => _DieceState();
}

class _DieceState extends State<Diece> {
  int leftDiceImage = 1;
  int rightDiceImage = 6;

  void changeDiceImage() {
    setState(() {
      leftDiceImage = Random().nextInt(6) + 1;
      rightDiceImage = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      appBar: AppBar(
        title: Text('Lucky Winner'),
        backgroundColor: Colors.yellow[900],
      ),
      body: Center(
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  highlightColor: Colors.yellow[800],
                  splashColor: Colors.yellow[800],
                  child: Image.asset('images/dice$leftDiceImage.png'),
                  onPressed: () {
                    changeDiceImage();
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  highlightColor: Colors.yellow[800],
                  splashColor: Colors.yellow[800],
                  child: Image.asset('images/dice$rightDiceImage.png'),
                  onPressed: () {
                    changeDiceImage();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
