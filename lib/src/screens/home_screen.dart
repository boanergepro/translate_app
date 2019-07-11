import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate_app/src/providers/app.dart';
import 'package:translate_app/src/resources/languages.dart';
import 'package:translate_app/src/utils/translate.dart';
import 'package:translate_app/src/widgets/appbar.dart';
import 'package:translate_app/src/widgets/floating_action_button.dart';
import 'package:translate_app/src/widgets/bottom_appbar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:translate_app/src/models/favorite.dart';

class HomeScreen extends StatelessWidget {
  static final routerName = '/home_screen';
  TextEditingController _translateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context);
    double _screenHeight = MediaQuery.of(context).size.height;

    _translateController.text = appState.currentText;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar(context, appState),
      body: SingleChildScrollView(
        child: Container(
          height: _screenHeight / 1.2,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(
                    right: 20,
                    left: 20,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            onChanged: (value) {
                              appState.languageFrom = value;
                            },
                            items: languages.entries.map((MapEntry entry) {
                              return DropdownMenuItem(
                                child: Text(
                                  entry.value,
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                value: entry.key,
                              );
                            }).toList(),
                            hint: Text(
                              'Language',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: appState.currentTheme != ThemeData.dark()
                                    ? Colors.grey[600]
                                    : Colors.white,
                              ),
                            ),
                            value: appState.languageFrom,
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 3,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: IconButton(
                            color: Colors.black,
                            onPressed: () {
                              Translate.exchangeLanguages(context);
                            },
                            icon: Icon(
                              Icons.compare_arrows,
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 4,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            onChanged: (value) {
                              appState.languageTo = value;
                            },
                            items: languages.entries.map((MapEntry entry) {
                              return DropdownMenuItem(
                                child: Text(
                                  entry.value,
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                value: entry.key,
                              );
                            }).toList(),
                            hint: Text(
                              'Language',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: appState.currentTheme != ThemeData.dark()
                                    ? Colors.grey[600]
                                    : Colors.white,
                              ),
                            ),
                            value: appState.languageTo,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 8,
                                child: TextField(
                                  textInputAction: TextInputAction.done,
                                  cursorColor: Colors.greenAccent[200],
                                  controller: _translateController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Type somethig',
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                  maxLines: 5,
                                  onChanged: (value) {
                                    appState.currentText = value;
                                  },
                                  onEditingComplete: () {
                                    Translate.translator(context);
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        Firestore.instance
                                            .collection('favorite')
                                            .add({
                                          'translateFrom': appState.currentText,
                                          'translateTo':
                                              appState.translatedText,
                                        });
                                      },
                                      icon: Icon(
                                        Icons.star_border,
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _translateController.text = '';
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[300],
                          ),
                          Expanded(
                            child: appState.loading
                                ? Center(
                                    child: SpinKitThreeBounce(
                                      color: Colors.greenAccent[200],
                                      size: 30,
                                    ),
                                  )
                                : Text(
                                    appState.translatedText,
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 15.0,
                                      color: appState.error
                                          ? Colors.red
                                          : appState.currentTheme !=
                                                  ThemeData.dark()
                                              ? Colors.black
                                              : Colors.white,
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: <Widget>[
                          Card(
                            child: Container(
                              width: 300,
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.greenAccent[200],
                                    ),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Text English',
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          Text(
                                            'Text Spanish',
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 12.0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            indent: 10,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomAppBar(context: context),
      resizeToAvoidBottomPadding: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButton(
        context: context,
        appState: appState,
        translate: _translateController.text,
      ),
    );
  }
}
