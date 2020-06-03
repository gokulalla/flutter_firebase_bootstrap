import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  String displayName;
  String email;
  String uid;
  String password;

  UserData({this.displayName, this.email, this.uid, this.password});
}

class UserAuth {
  String statusMsg="Account Created Successfully";
  //To create new User
  Future<String> createUser(UserData userData) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(
        email: userData.email, password: userData.password);
    return statusMsg;
  }

  //To verify new User
  Future<String> verifyUser (UserData userData) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(email: userData.email, password: userData.password);

    firebaseAuth.currentUser().then((value) async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', value.uid);
      prefs.setString('email', value.email);
      prefs.setString('displayName', value.displayName);
      value.getIdToken().then((onValue) async{
        await prefs.setString('token', onValue.token );
      });
    });

    return "Login Successfull";
  }

  Future<FirebaseUser> verifyToken() async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return firebaseAuth.currentUser();
  }
}
