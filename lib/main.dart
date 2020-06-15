import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController _notesController1 = new TextEditingController();
TextEditingController _notesController2 = new TextEditingController();
List<String> data = [];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              title: Text('Trash'),
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
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap:() {},
            title: Text(
              data[index],
            ),
          ),
          );
       },
      ),
          
      floatingActionButton: FloatingActionButton(
              elevation: 9.0,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => SharedPreference1()));
        },
        backgroundColor: Colors.blueGrey[300],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }
}

Future<bool> saveData(String nameKey, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameKey, value);
  }
Future<String> loadData(String nameKey) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameKey);
  }
class Hero extends State<SharedPreference1> {
  Widget buildSaveButton(context) {
  return Container(
    color: Colors.blueGrey[700],
    margin: EdgeInsets.only(top:340.0),
    child: RaisedButton.icon(
      elevation: 9.0,
      icon: Icon(Icons.save),
      label: Text('Save'),
      color: Colors.white,
      onPressed: () async {
        await saveData("_key_name", _notesController2.text);
        await setData();
        print(data);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ); 
        }      
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
                buildSaveButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() {
    loadData("_key_name").then((value) {
      setState(() {
        if(value==null){
          print("Value not available.");
        }
        else{
          data.add(value);
        }
        
      });
    });
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
                border: InputBorder.none,
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
          hintText: 'Create Note Here',
        ),
        cursorColor: Colors.white,
        autofocus: true,
        style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Montserrat'),
      ),
    ),
  );
}

class SharedPreference1 extends StatefulWidget {
  SharedPreference1() : super(); 
  @override
  Hero createState() => Hero();
}