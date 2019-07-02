import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';
import 'package:translate_app/src/providers/app.dart';
import 'package:translate_app/src/utils/theme.dart';
import 'package:translate_app/src/resources/languages.dart';
import 'package:translate_app/src/utils/translate.dart';

class HomeScreen extends StatelessWidget {
  static final routerName = '/home_screen';
  TextEditingController _translateController = TextEditingController();
  String from;
  String to;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context);
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Translate',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  '.',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 30.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Spacer(
                  flex: 11,
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      CustomTheme.changeTheme(context);
                    },
                    icon: Icon(
                      appState.currentTheme != ThemeData.dark()
                          ? Icons.brightness_2
                          : Icons.brightness_high,
                      color: CustomTheme.colorIconTheme(context),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: _screenHeight / 1.1,
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
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 8,
                                child: TextField(
                                  controller: _translateController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Type somethig',
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                  maxLines: 5,
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: <Widget>[
                                      IconButton(
                                        onPressed: () {},
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
                                  )),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[300],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'translated text',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
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
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, int index) {
                      return Card(
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
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
    );
  }
}
