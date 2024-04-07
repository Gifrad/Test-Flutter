part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  final List<XFile> video;
  const VideoState(this.video);

  @override
  List<Object> get props => [video];
}

class VideoInitial extends VideoState {
  const VideoInitial(super.video);
}

class VideoLoaded extends VideoState {
  const VideoLoaded(super.video);
}
