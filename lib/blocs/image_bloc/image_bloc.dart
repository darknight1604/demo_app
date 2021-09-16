import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_app/helper/constants.dart';
import 'package:demo_app/repositories/image_repository.dart';
import 'package:equatable/equatable.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc({
    required this.imageRepository,
  }) : super(ImageInitial());

  final ImageRepository imageRepository;
  List<String> images = [];

  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    if (event is GetListImageRequest) {
      yield* _mapGetListImageRequestToState(event.isInitial);
    }
  }

  Stream<ImageState> _mapGetListImageRequestToState(bool isInitial) async* {
    if (state is Loading) {
      print('busy');
    } else {
      yield Loading();
      if (isInitial) {
        Map<String, dynamic> result = await imageRepository.getListImage();
        images = readData(result[Constants.DATA]);
        if (images.isNotEmpty) {
          yield ImageLoaded(
              images: images, isReachedMax: !result[Constants.HAS_NEXT]);
        } else {
          yield ImageNotFound();
        }
      } else if (images.isNotEmpty) {
        Map<String, dynamic> result =
            await imageRepository.getListImage(start: images.length);
        List<String> imageDataTemp = readData(result[Constants.DATA]);
        if (imageDataTemp.isNotEmpty) {
          images.addAll(imageDataTemp);
          yield ImageLoaded(
              images: images, isReachedMax: !result[Constants.HAS_NEXT]);
        } else {
          yield ImageLoaded(
            images: images,
            isReachedMax: true,
          );
        }
      }
    }
  }

  List<String> readData(data) {
    return (data as List).map((item) => item as String).toList();
  }
}
