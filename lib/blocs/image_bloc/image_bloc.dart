import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_app/repositories/image_repository.dart';
import 'package:equatable/equatable.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc({
    required this.imageRepository,
  }) : super(ImageInitial());

  final ImageRepository imageRepository;

  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    if (event is GetListImageRequest) {
      yield* _mapGetListImageRequestToState();
    }
  }

  Stream<ImageState> _mapGetListImageRequestToState() async* {
    if (state is Loading) {
      print('busy');
    } else {
      yield Loading();
      List<String> images = await imageRepository.getListImage();
      if (images.isNotEmpty) {
        yield ImageLoaded(images: images);
      } else {
        yield ImageNotFound();
      }
    }
  }
}
