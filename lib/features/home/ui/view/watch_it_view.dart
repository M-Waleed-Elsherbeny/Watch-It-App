import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/core/ids.dart';
import 'package:watch_it/features/home/data/cubit/home_cubit.dart';
import 'package:watch_it/features/home/data/cubit/home_state.dart';
import 'package:watch_it/features/home/ui/view/play_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchItView extends StatelessWidget {
  const WatchItView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getAllVideo(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xffF70000),
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
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state is GetVideosLoading
                ? Center(
                    child: CircularProgressIndicator(color: Color(0xffF70000)),
                  )
                : state is GetVideosSuccess && state.videos.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: ids.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          final video = state.videos[index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PlayVideo(video: video),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                blurStyle: BlurStyle.outer,
                                color: Color(0xffF70000),
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                clipBehavior: Clip.hardEdge,
                                child: YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: state.videos[index].videoId,
                                    flags: const YoutubePlayerFlags(
                                      autoPlay: false,
                                      mute: false,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                  left: 10.0,
                                ),
                                child: Text(
                                  state.videos[index].title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(child: Text("No Videos Available :("));
          },
        ),
      ),
    );
  }
}
