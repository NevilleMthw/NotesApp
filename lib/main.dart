import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    backgroundColor: Colors.grey[600],
    appBar: AppBar(
      title: Text(
        'Glass',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
          color: Colors.white,
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


