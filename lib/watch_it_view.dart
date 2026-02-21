import 'package:flutter/material.dart';
import 'package:watch_it/ids.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchItView extends StatelessWidget {
  const WatchItView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Watch It',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: ids.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.hardEdge,
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: ids[index]['id'],
                    flags: const YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                ids[index]['title'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
            ],
          );
        },
      ),
    );
  }
}
