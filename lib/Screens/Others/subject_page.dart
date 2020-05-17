import 'package:course_app/models/course_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubjectPage extends StatefulWidget {
  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          data['subName'],
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        )),
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, size: 20),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 15),
              child: SvgPicture.asset("assets/icons/more-vertical.svg"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 30),
                          CourseContent(
                            number: "01",
                            duration: 5.35,
                            title: "Welcome to the Course",
                            isDone: true,
                          ),
                          CourseContent(
                            number: '02',
                            duration: 19.04,
                            title: "Design Thinking - Intro",
                            isDone: true,
                          ),
                          CourseContent(
                            number: '03',
                            duration: 15.35,
                            title: "Design Thinking Process",
                          ),
                          CourseContent(
                            number: '04',
                            duration: 5.35,
                            title: "Customer Perspective",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
