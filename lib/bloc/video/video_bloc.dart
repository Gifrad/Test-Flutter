import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoInitial(List.empty())) {
    on<VideoEvent>((event, emit) async {
      if (event is AddVideo) {
        List<XFile> newVideo = List.from(state.video)..addAll(event.video);
        emit(VideoLoaded(newVideo));
      }
    });
  }
}
