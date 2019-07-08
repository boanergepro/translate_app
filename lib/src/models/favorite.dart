import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  String _id;
  String _translateFrom;
  String _translateTo;

  Favorite.fromSnapshot(DocumentSnapshot doc) {
    _id = doc.documentID;
    _translateFrom = doc.data['translateFrom'] ?? '';
    _translateTo = doc.data['translateTo'] ?? '';
  }

  String get id => _id;

  String get translateFrom => _translateFrom;

  String get translateTo => _translateTo;

  set translateFrom(value) {
    _translateFrom = value;
  }

  set translateTo(value) {
    _translateTo = value;
  }
}