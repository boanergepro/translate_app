import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:translate_app/src/screens/welcome_screen.dart';
import 'package:translate_app/src/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      theme: ThemeData(
        backgroundColor: Colors.grey[300],
        buttonColor: Colors.green,
      ),
      home: Translate(),
    );
  }
}

class Translate extends StatefulWidget {
  @override
  _TranslateState createState() => new _TranslateState();
}

class _TranslateState extends State<Translate> {
  GoogleTranslator translator = new GoogleTranslator();
  TextEditingController inputController = new TextEditingController();
  String _translate = '...';

  void _actionTranlate() async {
    var i = await translator.translate(inputController.text,
        from: 'auto', to: 'zh-cn');
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
            onPressed: () {
              Navigator.pushNamed(context, WelcomeScreen.routerName);
            },
          )
        ],
        title: Text('Traductor'),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 15, left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: inputController,
              autocorrect: true,
              decoration:
                  InputDecoration(hintText: 'Ingrese el texto a traducir'),
            ),
            FlatButton(
              color: Colors.orange,
              onPressed: _actionTranlate,
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
