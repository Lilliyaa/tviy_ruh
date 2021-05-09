
import 'package:flutter/material.dart';

class lesson_video extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<lesson_video> {
  //VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
   // _controller = VideoPlayerController.network(
    //    'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
    //  ..initialize().then((_) {
    //    // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //    setState(() {});
    //  });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(

      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

  }
}