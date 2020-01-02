import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

class LuckySeven extends StatefulWidget {
  LuckySeven({Key key}) : super(key: key);

  @override
  _LuckySevenState createState() => _LuckySevenState();
}

class _LuckySevenState extends State<LuckySeven> {
  String luckyImage = 'images/lucky_1.png';
  int luckyNumber = 1;

  void lucyWinner() async {
    setState(() {
      luckyImage = 'images/loader.gif';
    });

    Future.delayed(Duration(seconds: 3), () async {
      setState(() {
        luckyNumber = Random().nextInt(7) + 1;
        luckyImage = 'images/lucky_$luckyNumber.png';
      });
    });

    Future.delayed(Duration(seconds: 4), () async {
      if (luckyNumber == 7) {
        _showWinnerAlert();
      }
    });
  }

  void _showWinnerAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 5.0,
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            content: Container(
              height: 300.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    '  Congratulations! ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 5.0,
                        color: Colors.red[900]),
                  ),
                  Text(
                    'You won the lucky seven number.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.red[300]),
                  ),
                  Expanded(
                    child: Image.asset('images/lucky_coin_winner.gif'),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Lucky Winner'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  lucyWinner();
                },
                child: Image.asset(luckyImage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
