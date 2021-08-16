part of 'image_cubit.dart';

@immutable
abstract class ImageState {}

class ImageInitial implements ImageState {}

class ImageListingLoading implements ImageState {}

class ImageListingLoaded implements ImageState {
  final List<Showcase> showcaseListing;

  ImageListingLoaded(this.showcaseListing);
}

class ImageListingNoContent implements ImageState {}

class ImageListingLoadError implements ImageState {}
