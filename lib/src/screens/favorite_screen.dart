import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate_app/src/providers/app.dart';
import 'package:translate_app/src/widgets/appbar.dart';
import 'package:translate_app/src/widgets/floating_action_button.dart';
import 'package:translate_app/src/widgets/bottom_appbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteScreen extends StatelessWidget {
  static final routerName = '/favorite_screen';

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar(context, appState),
      body: Column(
        children: <Widget>[
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 2,
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
            flex: 25,
            child: Container(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Container(
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 120,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.star,
                                  color: Colors.greenAccent[200],
                                ),
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
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        iconWidget: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                          size: 30,
                        ),
                        closeOnTap: true,
                        color: Theme.of(context).backgroundColor,
                        onTap: () {
                          print('touch');
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomAppBar(context: context, favorite: true),
      resizeToAvoidBottomPadding: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButton(context: context),
    );
  }
}
