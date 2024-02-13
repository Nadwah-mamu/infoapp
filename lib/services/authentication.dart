import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:info_app/models/routes.dart';
import 'package:info_app/services/sharedpref.dart';

final auth = FirebaseAuth.instance;
final fireStore = FirebaseFirestore.instance;

CollectionReference userCollection = fireStore.collection("users");

Future<bool?> flutterToast = Fluttertoast.showToast(msg: "Successfully Login");

signUp(
    {required String email,
    required String password,
    required BuildContext context}) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (userCredential != null) {
      String? userUID = userCredential.user?.uid;
      await userCollection
        .doc(userUID)
        .set({"password": password, "email": email});
      Navigator.pushAndRemoveUntil(
          context, Routes().userListRoute, (route) => false);
      flutterToast;


    }

    return true;
  } catch (e) {
    print(e);
    String error = e.toString();
    if (error
        .contains("The email address is already in use by another account")) {
      await Fluttertoast.showToast(
          msg: "The email address is already in use by another account",
          timeInSecForIosWeb: 3,
          fontSize: 20);
    }
    if (error.contains("The email address is badly formatted")) {
      await Fluttertoast.showToast(
          msg: "The email address is in bad format", fontSize: 20);
    }
    if (error.contains("Password should be at least 6 characters")) {
      await Fluttertoast.showToast(
          msg: "Password should be at least 6 characters",
          fontSize: 20,
          timeInSecForIosWeb: 3);
    }

    return false;
  }
}

login(
    {required String email,
    required String password,
    required BuildContext context}) async {
  try {
    var user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (user != null) {
      Navigator.pushAndRemoveUntil(
          context, Routes().userListRoute, (route) => false);
      flutterToast;
    }

    return true;
    //
  } catch (e) {
    print(e);
    String error = e.toString();
    if (error.contains(
        "There is no user record corresponding to this identifier. The user may have been deleted.")) {
      await Fluttertoast.showToast(msg: "Incorrect email");
    }

    if (error.contains(
        "The password is invalid or the user does not have a password.")) {
      await Fluttertoast.showToast(msg: "Incorrect password");
    }
    return false;
  }
}

//fetching user login information from firestore

User? currentUser = auth.currentUser;
Map<String, dynamic> userData = {};


fetchUserData() async {
  if (currentUser != null){
    String? userUid = currentUser?.uid;
    final snapshot = await fireStore.collection("users").doc(userUid).get();
    if (snapshot.exists) {
      userData = snapshot.data()!;
      return userData;
    }
  }
}


void signOut(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, Routes().loginRoute, (route) => false);
                auth.signOut();
                sharedPreferences.then((value) {
                  value.getBool("signIn");
                  value.clear();
                });


              },
              child: Text("Yes"),
            ),            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("No"),
            )

          ],
          title: Text("Are you sure you want to exit?"),
        );
      });
}
