class AllVideosModels {
  final String title, videoId;
  AllVideosModels({
    required this.title,
    required this.videoId,
  });

  factory AllVideosModels.fromVideosTable(Map<String, dynamic> videos) {
    return AllVideosModels(
      title: videos["title"],
      videoId: videos["video_id"],
    );
  }
}
