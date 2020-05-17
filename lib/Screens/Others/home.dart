import 'package:course_app/models/category.dart';
import 'package:course_app/services/auth.dart';
import 'package:course_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final AuthService _auth = AuthService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Container(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.0, color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      if (scaffoldKey.currentState.isDrawerOpen) {
                        scaffoldKey.currentState.openEndDrawer();
                      } else {
                        scaffoldKey.currentState.openDrawer();
                      }
                    },
                    child: SvgPicture.asset(
                      "assets/icons/menu.svg",
                      width: 25,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Search for anything',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 70),
                  IconButton(
                    icon: Icon(Icons.account_circle,
                        size: 35, color: Colors.green),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("Hey Sudhanshu,", style: kHeadingextStyle),
            Text("Find a course you want to learn", style: kSubheadingextStyle),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Category", style: kTitleTextStyle),
                Text(
                  "See All",
                  style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: categories.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/subject', arguments: {
                        'img': categories[index].image,
                        'subName': categories[index].name
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: index.isEven ? 200 : 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            categories[index].name,
                            style: kTitleTextStyle,
                          ),
                          Text(
                            '${categories[index].numOfCourses} Courses',
                            style: TextStyle(
                              color: kTextColor.withOpacity(.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        elevation: 10.0,
        autofocus: true,
        child: new Icon(Icons.account_circle, size: 30),
        backgroundColor: Colors.green,
        onPressed: () async {
          await _auth.signOut();
        },
      ),
    );
  }
}
