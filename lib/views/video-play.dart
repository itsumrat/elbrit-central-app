import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';


class VideoApp extends StatefulWidget {
  final dynamic video;
  VideoApp({required this.video});
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    videController();

  }

  VideoPlayerController videController(){
    _controller = VideoPlayerController.network(
        'https://admin.elbrit.org/uploads/${widget.video}')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.play();
    return _controller;
  }
  late Future videoPlay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}


// import 'package:better_player/better_player.dart';
// import 'package:flutter/material.dart';
//
// class BasicPlayerPage extends StatefulWidget {
//   final String video;
//   BasicPlayerPage({required this.video});
//   @override
//   _BasicPlayerPageState createState() => _BasicPlayerPageState();
// }
//
// class _BasicPlayerPageState extends State<BasicPlayerPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Center(
//         child: AspectRatio(
//         aspectRatio: 16 / 9,
//         child: BetterPlayer.network(
//           //https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4
//           "http://admin.elbrit.org/uploads/20220806202630.mp4",
//
//         ),
//     ),
//       ),
//     );
//   }
// }
//
// class Utils {
//   static Future<String> getFileUrl() async {
//     final file = "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
//     return file;
//   }
// }