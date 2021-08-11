import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum Status { uninitialized, authenticated, authenticating, unauthenticated }

class UserModel with ChangeNotifier {
  late User? _user;
  final FirebaseAuth? _auth;
  Status _status = Status.uninitialized;
  UserModel.instance() : _auth = FirebaseAuth.instance {
    _auth!.authStateChanges().listen(_onAuthStateChanged);
  }

  String id() => _user!.uid;

  User get user => _user!;
  FirebaseAuth get auth => _auth!;
  Status get status => _status;

  Future<void> signInAnonymously() async {
    try {
      _status = Status.authenticating;
      notifyListeners();
      await _auth!.signInAnonymously();
      _status = Status.authenticated;
      notifyListeners();
    } catch (e) {
      _status = Status.unauthenticated;
      notifyListeners();
    }
  }

  Future<void> _onAuthStateChanged(User? user) async {
    if (user == null) {
      _status = Status.unauthenticated;
    } else {
      _user = user;
      _status = Status.authenticated;
    }
    notifyListeners();
  }
}
