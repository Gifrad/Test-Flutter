part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class AddCamera extends ImageEvent {
  final XFile camera;
  const AddCamera(this.camera);
}
