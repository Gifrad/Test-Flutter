import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial(List.empty())) {
    on<ImageEvent>((event, emit) async {
      
      if (event is AddCamera) {
        List<XFile> newCamera = List.from(state.image)..add(event.camera);
        emit(ImageLoaded(newCamera));
      }
    });
  }
}
