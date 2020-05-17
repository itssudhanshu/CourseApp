import 'package:course_app/Screens/Authentication/signin.dart';
import 'package:course_app/Screens/Authentication/signup.dart';
import 'package:course_app/Screens/Others/subject_page.dart';
import 'package:course_app/Screens/Others/vlcplayer.dart';
import 'package:course_app/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:course_app/services/auth.dart';
import 'package:course_app/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // initialRoute: '/signin',
        routes: <String, WidgetBuilder>{
          '/subject': (BuildContext context) => new SubjectPage(),
          '/signin': (BuildContext context) => new SignIn(),
          '/vlcvideo': (BuildContext context) => new VLCPlayer(),
        },
        home: Wrapper(),
      ),
    );
  }
}
