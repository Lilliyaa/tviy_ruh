import 'package:flutter_apptest/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonVideo extends StatelessWidget {
  final String videoLink;
  TextEditingController _addItemController = TextEditingController();
  YoutubePlayerController _youtubePlayerController;

  LessonVideo(this.videoLink);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).primaryColor,
      body: Column(
        children: [
          Flexible(
              child: Container(
                color: Theme.of(context).primaryColor,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child:Container(
                        margin: EdgeInsets.all(8),
                        child: YoutubePlayer(
                          controller: YoutubePlayerController(
                              initialVideoId: YoutubePlayer.convertUrlToId(videoLink),
                              flags: YoutubePlayerFlags(
                                autoPlay: false,
                              )),
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.blue,
                          progressColors: ProgressBarColors(
                              playedColor: Colors.blue,
                              handleColor: Colors.blueAccent),
                        ),
                      ))),
        ],
      ),
      );
  }

}