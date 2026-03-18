import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:watch_it/features/home/data/cubit/home_state.dart';
import 'package:watch_it/features/home/data/model/all_videos_models.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());

  SupabaseClient supabase = Supabase.instance.client;
  Future<void> getAllVideo() async {
    try {
      emit(GetVideosLoading());
      final response = await supabase.from("videos").select();
      List<AllVideosModels> videos = [];

      for (var video in response) {
        videos.add(AllVideosModels.fromVideosTable(video));
      }
      emit(GetVideosSuccess(videos: videos));
    } catch (e) {
      emit(GetVideosError(errMsg: e.toString()));
    }
  }
}
