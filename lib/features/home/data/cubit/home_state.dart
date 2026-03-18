import 'package:watch_it/features/home/data/model/all_videos_models.dart';

abstract class HomeState {}

final class InitialHomeState extends HomeState {}

final class GetVideosLoading extends HomeState {}

final class GetVideosError extends HomeState {
  final String errMsg;
  GetVideosError({required this.errMsg});
}

final class GetVideosSuccess extends HomeState {
  final List<AllVideosModels> videos;
  GetVideosSuccess({required this.videos});
}
