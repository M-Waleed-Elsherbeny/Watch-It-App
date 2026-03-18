import 'package:flutter/material.dart';
import 'package:watch_it/features/home/data/model/all_videos_models.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideo extends StatelessWidget {
  const PlayVideo({super.key, required this.video});
  final AllVideosModels video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF70000),
        title: Text(
          video.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.hardEdge,
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: video.videoId,
                flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
