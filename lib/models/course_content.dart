import 'package:course_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  final String url;
  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: kHeadingextStyle.copyWith(
              color: kTextColor.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 20),
          Container(
            // width: 180,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$duration mins\n",
                    style: TextStyle(
                      color: kTextColor.withOpacity(.5),
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: title,
                    style: kSubtitleTextSyule.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              print('yes');
              Navigator.pushReplacementNamed(context, '/vlcvideo',
                  arguments: {'url': url});
            },
            child: Container(
              margin: EdgeInsets.only(left: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kGreenColor.withOpacity(isDone ? 1 : .5),
              ),
              child: Icon(Icons.play_arrow, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
