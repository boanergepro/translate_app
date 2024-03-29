import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate_app/src/providers/app.dart';
import 'package:translate_app/src/widgets/appbar.dart';
import 'package:translate_app/src/widgets/floating_action_button.dart';
import 'package:translate_app/src/widgets/bottom_appbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:translate_app/src/models/favorite.dart';

class FavoriteScreen extends StatelessWidget {
  static final routerName = '/favorite_screen';

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context);
    void _showAlert(String value) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return new AlertDialog(
              content: new Text(value),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () async {
                    var snapshot = await Firestore.instance.collection('favorite').getDocuments();
                    snapshot.documents.forEach((doc) {
                      doc.reference.delete();
                    });
                    Navigator.of(context).pop();
                  },
                  child: new Text('Yes'),
                ),
                new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text('No'),
                )
              ],
            );
          }
      );
    }

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
                onPressed: () async{
                  var query = await Firestore.instance.collection('favorite').getDocuments();
                  if(query.documents.isNotEmpty){
                    _showAlert('Are you sure to eliminate?');
                  }
                },
              ),
            ),
          ),
          Expanded(
            flex: 25,
            child: Container(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: StreamBuilder(
                stream: Firestore.instance.collection('favorite').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.greenAccent[200])),
                    );
                  } else {
                    List<Favorite> _favorites = snapshot.data.documents
                        .map((doc) => Favorite.fromSnapshot(doc))
                        .toList();
                    if (_favorites.isEmpty) {
                      return Center(
                        child: Text(
                          'Data not available',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14.0,
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: _favorites.length,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              _favorites[index].translateFrom,
                                              style: TextStyle(
                                                fontFamily: 'Lato',
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            Text(
                                              _favorites[index].translateTo,
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
                                  Firestore.instance
                                      .collection('favorite')
                                      .document('${_favorites[index].id}')
                                      .delete();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
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
