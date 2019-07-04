import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate_app/src/providers/app.dart';
import 'package:translate_app/src/widgets/appbar.dart';
import 'package:translate_app/src/widgets/floating_action_button.dart';
import 'package:translate_app/src/widgets/bottom_appbar.dart';

class ItemFavoriteScreen extends StatelessWidget {
  static final routerName = '/item_favorite_screen';

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context);
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar(context, appState),
      body: Column(
      children: <Widget>[
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Favorites',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 31.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(right: 15),
              alignment: Alignment.topRight,
              child: FlatButton(
                child: Text(
                  'Clear All',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 15.0,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Container(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 120,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.star, color: Colors.green,),
                          ),
                          Expanded(
                            flex: 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomAppBar(context),
      resizeToAvoidBottomPadding: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButton(context:context),
    );
  }
}
