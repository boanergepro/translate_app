import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:translate_app/src/resources/languages.dart';

class Translate extends StatefulWidget {
  static final routerName = '/example';

  @override
  _TranslateState createState() => new _TranslateState();
}

class _TranslateState extends State<Translate> {
  GoogleTranslator translator = new GoogleTranslator();
  TextEditingController inputController = new TextEditingController();
  String _translate = '...';
  String from;
  String to;

  void _actionTranslate({String from: 'auto', String to: 'ta'}) async {
    var i =
        await translator.translate(inputController.text, from: from, to: to);
    setState(() {
      _translate = i;
      print(_translate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
        title: Text('Traductor'),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 15, left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton(
              onChanged: (value) {
                setState(() {
                  from = value;
                });
              },
              items: languages.entries.map((MapEntry entry){
                return DropdownMenuItem(
                  child: Text(entry.value),
                  value: entry.key,
                );
              }).toList(),
              hint: Text('From'),
              value: from,
            ),
            DropdownButton(
              value: to,
              hint: Text('to'),
              onChanged: (value) {
                setState(() {
                  to = value;
                });
              },
              items: languages.entries.map((MapEntry entry) {
                return DropdownMenuItem(
                  child: Text(entry.value),
                  value: entry.key,
                );
              }).toList(),
            ),
            TextField(
              controller: inputController,
              autocorrect: true,
              decoration:
                  InputDecoration(hintText: 'Ingrese el texto a traducir'),
            ),
            FlatButton(
              color: Colors.orange,
              onPressed: () {_actionTranslate(from: from, to: to);},
              child: Text('Traducir'),
            ),
            Container(
              child: Text('$_translate'),
            )
          ],
        ),
      ),
    );
  }
}
