part of 'image_bloc.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class Loading extends ImageState {}

class ImageLoaded extends ImageState {
  final List<String> images;
  final bool isReachedMax;
  ImageLoaded({
    required this.images,
    this.isReachedMax = false,
  });
  @override
  List<Object> get props => [this.images];
}

class ImageNotFound extends ImageState {}
