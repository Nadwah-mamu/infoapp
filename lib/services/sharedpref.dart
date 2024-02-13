
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
class SharedPreference{
  void signInSharedPref() {
    sharedPreferences.then((value) => value.setBool("signIn", true));
  }

  // void alreadySignIn(BuildContext context) {
  //   sharedPreferences.then((value) {
  //     bool? signIn = value.getBool("signIn");
  //     if (signIn == true) {
  //       GoRouter.of(context).pushNamed(MyAppRouteConstants.userListRoute);
  //     }
  //     if (signIn == null) {
  //       GoRouter.of(context).pushNamed(MyAppRouteConstants.loginRoute);
  //     }
  //   });
  // }

}
