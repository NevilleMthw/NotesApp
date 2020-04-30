import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
    drawer: Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
          title: Text(
            'Glass',
            style: TextStyle(
          fontSize: 15.0,
          letterSpacing: 1.0,
          color: Colors.black,
          fontFamily: 'Montserrat',
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
          fontFamily: 'Montserrat',
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.grey[900],
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add), onPressed: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => Hero()));
      },
      backgroundColor: Colors.grey[900],
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  ));
  }
}

class Hero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}