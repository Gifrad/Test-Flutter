part of 'image_bloc.dart';

abstract class ImageState extends Equatable {
  final List<XFile> image;
  const ImageState(this.image);

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {
  const ImageInitial(super.image);
}

class ImageLoaded extends ImageState {
  const ImageLoaded(super.image);
}

