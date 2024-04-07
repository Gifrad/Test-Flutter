part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class AddVideo extends VideoEvent {
  final List<XFile> video;
  const AddVideo(this.video);

  @override
  List<Object> get props => [video];
}
