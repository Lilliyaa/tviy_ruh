import 'package:flutter_apptest/constants/strings.dart';
import  'package:flutter_youtube/flutter_youtube.dart';
import 'package:flutter/material.dart';

class LessonVideo extends StatelessWidget {
  final String videoLink;

  LessonVideo(this.videoLink);

  void playYoutubeVideo() {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: Strings.youtubeApiKey,
      videoUrl: videoLink,
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body:  new Padding(
          padding: const EdgeInsets.all(10.0),
          child:  new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new RaisedButton(
                child: new Text("Play Default Video"),
                onPressed: playYoutubeVideo),
          ),
        ),
         /* Container(
          width: 100,
          height: 100,
          child: FlutterYoutube.playYoutubeVideoByUrl(
            apiKey: Strings.youtubeApiKey,
            videoUrl: videoLink,
            autoPlay: true, //default falase
        ),)*/
      ),
    );
  }

}