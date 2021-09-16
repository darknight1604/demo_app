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
  ImageLoaded({required this.images});
}

class ImageNotFound extends ImageState {}
