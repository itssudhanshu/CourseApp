import 'package:course_app/Screens/Authentication/signin.dart';
import 'package:course_app/Screens/Others/home.dart';
import 'package:course_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either home or signin widget
    if (user == null) {
      return SignIn();
    } else {
      return HomePage();
    }
  }
}
