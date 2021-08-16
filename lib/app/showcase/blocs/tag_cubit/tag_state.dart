part of 'tag_cubit.dart';

@immutable
abstract class TagState {}

class TagInitial implements TagState {}

class TagListingLoading implements TagState {}

class TagListingLoaded implements TagState {
  final List<String> tagListing;

  TagListingLoaded(this.tagListing);
}

class TagListingNoContent implements TagState {}

class TagListingLoadError implements TagState {}
