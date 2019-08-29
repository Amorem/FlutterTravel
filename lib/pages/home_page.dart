import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: false,
        right: false,
        bottom: true,
        minimum: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05,
            0, MediaQuery.of(context).size.width * 0.05, 0),
        child: _mainColumn(),
      ),
    );
  }
}

Widget _mainColumn() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Colors.black87,
            size: 35.0,
          ),
          Container(
            height: 39,
            width: 144,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/logo_discover.png'),
              ),
            ),
          ),
          Icon(
            Icons.search,
            color: Colors.black87,
            size: 35.0,
          ),
        ],
      )
    ],
  );
}
