import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
class VLCPlayer extends StatefulWidget {
  @override
  _VLCPlayerState createState() => _VLCPlayerState();
}

class _VLCPlayerState extends State<VLCPlayer> {

  VlcPlayerController _videoViewController;
  Map data = {};

  @override
  void initState() {
    _videoViewController = new VlcPlayerController(onInit: () {
      _videoViewController.play();
    });
    _videoViewController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  final double playerWidth = 640;
  final double playerHeight = 360;

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data['url']);


    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: playerHeight,
              width: playerWidth,
              child: new VlcPlayer(
                aspectRatio: 16 / 9,
                url: "https://www.youtube.com/watch?v=ss0sg9aMEFE&feature=youtu.be",
                controller: _videoViewController,
                placeholder: Center(child: CircularProgressIndicator()),
              ),
            ),
            FlatButton(
                child: Text("+speed"),
                onPressed: () => _videoViewController.setPlaybackSpeed(2.0)),
            FlatButton(
                child: Text("Normal"),
                onPressed: () => _videoViewController.setPlaybackSpeed(1)),
            FlatButton(
                child: Text("-speed"),
                onPressed: () => _videoViewController.setPlaybackSpeed(0.5)),
            Text("position=" +
                _videoViewController.position.inSeconds.toString() +
                ", duration=" +
                _videoViewController.duration.inSeconds.toString() +
                ", speed=" +
                _videoViewController.playbackSpeed.toString()),
            Text("ratio=" + _videoViewController.aspectRatio.toString()),
            Text("size=" +
                _videoViewController.size.width.toString() +
                "x" +
                _videoViewController.size.height.toString()),
            Text("state=" + _videoViewController.playingState.toString()),
          ],
        ),
      ),
    );
  }
}

// class VLCPlayer extends StatefulWidget {
//   @override
//   _VLCPlayerState createState() => _VLCPlayerState();
// }

// class _VLCPlayerState extends State<VlcPlayer> {
//   VlcPlayerController _videoViewController;
//   Map data = {};

//   @override
//   void initState() {
//     _videoViewController = new VlcPlayerController(onInit: () {
//       _videoViewController.play();
//     });
//     // _videoViewController.addListener(() {

//     // });
//     super.initState();
//   }

//   final double playerWidth = 640;
//   final double playerHeight = 360;

//   @override
//   Widget build(BuildContext context) {
//     data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
//     print(data['url']);
//     return Scaffold(
//       body: Center(
//         child: ListView(
//           shrinkWrap: true,
//           children: <Widget>[
//             // SizedBox(
//             //   height: playerHeight,
//             //   width: playerWidth,
//             //   child: new VlcPlayer(
//             //     aspectRatio: 16 / 9,
//             //     url: data['url'],
//             //     controller: _videoViewController,
//             //     placeholder: Center(child: CircularProgressIndicator()),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
