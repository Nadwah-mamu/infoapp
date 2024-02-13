import 'package:flutter/material.dart';
import 'package:info_app/models/themes.dart';
import 'package:info_app/services/authentication.dart';
import 'package:info_app/services/sharedpref.dart';
import 'package:info_app/services/provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  bool isSignUp = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderClass>(context);

    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/736x/16/b2/75/16b275a88d210734f768d4f0be2fd903.jpg"))),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.deepOrange)),
                height: 40,
                child: TextFormField(
                  cursorColor: Colors.orangeAccent,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 5),
                      prefixIcon: Icon(
                        Icons.email,
                        size: 18,
                        color: Colors.black26,
                      ),
                      hintText: "email",
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  controller: emailController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "enter email";
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.deepOrange)),
                height: 40,
                child: TextFormField(
                  cursorColor: Colors.orangeAccent,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5, left: 5),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 18,
                        color: Colors.black26,
                      ),
                      hintText: "password",
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                  controller: passwordController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "enter your password";
                    }
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  final formFill = formKey.currentState!.validate();
                  if (formFill == true) {
                    provider.isSignUp == true
                        ? signUp(
                            email: emailController.text,
                            password: passwordController.text,context: context)
                        : login(
                            email: emailController.text,
                            password: passwordController.text,context: context);
                    SharedPreference().signInSharedPref();
                  }

                  emailController.clear();
                  passwordController.clear();
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orangeAccent,
                  ),
                  margin: EdgeInsets.only(top: 20, right: 10, left: 10),
                  child: Center(
                      child: provider.isSignUp == true
                          ? Text(
                              "Sign in",
                              style: signinbutton,
                            )
                          : Text(
                              "Log in",
                              style: signinbutton,
                            )),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        provider.isSignUp == true
                            ? Text(
                                "Already have an account ? ",
                                style: textStyle,
                              )
                            : Text(
                                "Create an account",
                                style: textStyle,
                              ),
                        provider.isSignUp == true
                            ? TextButton(
                                child: Text("Log in", style: buttonText),
                                onPressed: () {
                                  Provider.of<ProviderClass>(context,
                                          listen: false)
                                      .updateWidget();
                                },
                              )
                            : TextButton(
                                child: Text("Sign In", style: buttonText),
                                onPressed: () {
                                  Provider.of<ProviderClass>(context,
                                          listen: false)
                                      .updateWidget();
                                },
                              )
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
