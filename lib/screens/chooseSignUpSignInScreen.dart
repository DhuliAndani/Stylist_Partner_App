import 'dart:async';

import 'package:app/models/businessLayer/baseRoute.dart';
import 'package:app/screens/signInScreen.dart';
import 'package:app/screens/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class ChooseSignUpSignInScreen extends BaseRoute {
  ChooseSignUpSignInScreen({a, o})
      : super(a: a, o: o, r: 'ChooseSignUpSignInScreen');
  @override
  _ChooseSignUpSignInScreenState createState() =>
      new _ChooseSignUpSignInScreenState();
}

class _ChooseSignUpSignInScreenState extends BaseRouteState {
  bool isloading = true;

  _ChooseSignUpSignInScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exitAppDialog();
      },
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.75, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorLight
                ])),
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.28),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/appicon_120x120.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    AppLocalizations.of(context).lbl_gofresha,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge.color,
                        fontSize: 22,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  height: Get.height * 0.06,
                  width: MediaQuery.of(context).size.width - 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInScreen(
                                a: widget.analytics,
                                o: widget.observer,
                              )));
                    },
                    child: Text(
                      AppLocalizations.of(context).btnSignIn.toUpperCase(),
                      style: Theme.of(context)
                          .elevatedButtonTheme
                          .style
                          .textStyle
                          .resolve({MaterialState.pressed}).copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyLarge.color),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: Get.height * 0.06,
                  width: MediaQuery.of(context).size.width - 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen(
                                a: widget.analytics,
                                o: widget.observer,
                              )));
                    },
                    child: Text(
                      AppLocalizations.of(context).btnSignUp,
                      style: Theme.of(context)
                          .elevatedButtonTheme
                          .style
                          .textStyle
                          .resolve({MaterialState.pressed}).copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyLarge.color),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    isloading = true;
    timetsamp();
  }

  void timetsamp() {
    var duration = Duration(seconds: 3);
    Timer(duration, () {
      setState(() {
        isloading = false;
      });
    });
  }
}
