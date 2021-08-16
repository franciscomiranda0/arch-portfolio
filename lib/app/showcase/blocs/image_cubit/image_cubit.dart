import 'package:arch/app/showcase/repositories/models/showcase.dart';
import 'package:arch/app/showcase/repositories/showcase_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit({
    required ImageState initialState,
    required this.repository,
  }) : super(initialState);

  final ShowcaseRepository repository;

  Future<void> getImageListing() async {
    final List<Showcase> _showcaseListing = [];
    emit(ImageListingLoading());
    try {
      var _response = await repository.getImageListing();
      if (_response['data'] == null) {
        emit(ImageListingNoContent());
        return;
      }
      _showcaseListing.addAll(_getShowcaseList(_response['data']));
      emit(ImageListingLoaded(_showcaseListing));
    } on Exception {
      emit(ImageListingLoadError());
    }
  }

  List<Showcase> _getShowcaseList(map) {
    final List<Showcase> _list = [];
    map.forEach((item) => _list.add(Showcase.fromMap(item)));
    return _list;
  }
}
