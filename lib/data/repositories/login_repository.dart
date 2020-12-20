import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRepository {
  String get userId;
  Future login(String email);
  Future<bool> isLoggedIn();
}

class LoginRepo implements AuthRepository {
  String uid;
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  @override
  Future login(String email) async {
    return await userCollection.add({'email': email}).then((value) async {
      print(value.documentID);
      uid = value.documentID;
      final prefs = await SharedPreferences.getInstance();
      var key = 'uid';
      var val = uid;
      prefs.setString(key, val);
    });
  }

  @override
  String get userId => uid;

  @override
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString('uid');
    print(uid + 'this is the print');
    if (uid != null) {
      return true;
    } else {
      return false;
    }
  }
}
