import 'package:flutter/material.dart';
import './Screen/Dice.dart';
import './Screen/LuckySeven.dart';

void main() => runApp(
      MaterialApp(
          title: 'Material App',
          darkTheme: ThemeData.dark(),
          routes: <String, WidgetBuilder>{
            '/luckyseven': (BuildContext context) => new LuckySeven(),
            '/dice': (BuildContext context) => new Diece(),
          },
          home: MyApp()),
    );



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('DiCo Game'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                color: Colors.yellow[800],
                onPressed: () {
                  Navigator.of(context).pushNamed('/dice');
                },
                child: Image.asset('images/dice6.png'),
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            Expanded(
              child: FlatButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pushNamed('/luckyseven');
                },
                child: Image.asset('images/lucky_7.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
