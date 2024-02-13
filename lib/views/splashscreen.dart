import 'package:flutter/material.dart';
import 'package:info_app/models/routes.dart';
import 'package:info_app/services/sharedpref.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      sharedPreferences.then((value) {
        bool? signIn=value.getBool("signIn");
        if(signIn==true){
          Navigator.pushAndRemoveUntil(context, Routes().userListRoute, (route) => false);
        }
        else if(signIn==null){
          Navigator.pushAndRemoveUntil(context, Routes().loginRoute, (route) => false);
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Image.network(
            "https://i.pinimg.com/736x/16/b2/75/16b275a88d210734f768d4f0be2fd903.jpg"),
      ),
    );
  }
}
