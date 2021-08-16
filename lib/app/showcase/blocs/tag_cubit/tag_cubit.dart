import 'package:arch/app/showcase/repositories/showcase_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tag_state.dart';

class TagCubit extends Cubit<TagState> {
  TagCubit({
    required TagState initialState,
    required this.repository,
  }) : super(initialState);

  final ShowcaseRepository repository;

  Future<void> getTagListing() async {
    final List<String> _tagListing = [];
    emit(TagListingLoading());
    try {
      var _response = await repository.getTagListing();
      if (_response['data'] == null) {
        emit(TagListingNoContent());
        return;
      }
      _tagListing.addAll(_getUniqueTagListing(_response['data']));
      emit(TagListingLoaded(_tagListing));
    } on Exception {
      emit(TagListingLoadError());
    }
  }

  List<String> _getUniqueTagListing(List showcaseList) {
    final List<String> _uniqueTagList = [];
    for (var showcase in showcaseList) {
      for (var tag in showcase['tags']) {
        if (!_uniqueTagList.contains(tag)) _uniqueTagList.add(tag);
      }
    }
    return _uniqueTagList;
  }
}
