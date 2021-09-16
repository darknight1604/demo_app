part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class GetListImageRequest extends ImageEvent {
  final bool isInitial;
  GetListImageRequest({required this.isInitial});
}
