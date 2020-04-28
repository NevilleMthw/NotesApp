import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    drawer: Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
          title: Text(
            'Glass',
            style: TextStyle(
          fontSize: 10.0,
          letterSpacing: 1.0,
          color: Colors.black,
        ),
            ),
        ),
        ListTile(
          title: Text('Personal'),
        ),
        ListTile(
          title: Text('Expenses'),
        ),
        ListTile(
          title: Text('Random'),
        ),
        ],
        
      ),
    ),
    backgroundColor: Colors.grey[600],
    appBar: AppBar(
      title: Text(
        'Glass',
        style: TextStyle(
          fontSize: 20.0,
          letterSpacing: 1.0,
          color: Colors.white,
          fontFamily: 'Orbitron',
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.grey[900],
    ),
    floatingActionButton: FloatingActionButton(
      child: Text("+"), onPressed: () {},
      backgroundColor: Colors.grey[900],
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  ),
));

