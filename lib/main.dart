import 'package:flutter/material.dart';

TextEditingController _notesController1 =
    new TextEditingController();

TextEditingController _notesController2 = new TextEditingController();

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
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
      backgroundColor: Colors.blueGrey[700],
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
        backgroundColor: Colors.blueGrey[700],
      ),
      floatingActionButton: FloatingActionButton(
              elevation: 9.0,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Hero()));
        },
        backgroundColor: Colors.blueGrey[300],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }
}

class Hero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey[700],
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                buildHeading(context),
                buildNotesText(),
                buildSubmitButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildHeading(context) {
  return Material(
    color: Colors.blueGrey[700],
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              maxLines: 1,
              controller: _notesController1,
              decoration: InputDecoration(
                hintText: 'Note Title',
              ),
              style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Montserrat',),
            ),
          ),
          FlatButton(
            child: Icon(Icons.close, color: Colors.white, size: 27),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    ),
  );
}

Widget buildNotesText() {
  return Material(
    color: Colors.blueGrey[700],
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        maxLines: null,
        controller: _notesController2,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        cursorColor: Colors.white,
        autofocus: true,
        style: TextStyle(color: Colors.white,fontSize: 18),
      ),
    ),
  );
}

Widget buildSubmitButton(context) {
  return Container(
    color: Colors.blueGrey[700],
    margin: EdgeInsets.only(top:340.0),
    child: RaisedButton.icon(
      elevation: 9.0,
      icon: Icon(Icons.save),
      label: Text('Save'),
      color: Colors.white,
      onPressed: () async {
        Navigator.of(context).pop();
      },
    ),
  );
}
