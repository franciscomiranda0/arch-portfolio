import 'package:arch/app/showcase/blocs/image_cubit/image_cubit.dart';
import 'package:arch/app/showcase/repositories/json/database_json.dart';
import 'package:arch/app/showcase/repositories/showcase_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SpyImageRepositoryImplementation extends Mock
    implements ShowcaseImageRepositoryImplementation {}

void main() {
  late ImageCubit _cubit;
  late ShowcaseRepository _repository;

  setUp(() {
    _repository = SpyImageRepositoryImplementation();
    _cubit = ImageCubit(
      initialState: ImageInitial(),
      repository: _repository,
    );
  });

  tearDown(() {
    _cubit.close();
  });

  group('[ImageCubit] tests:', () {
    test('Should emit [ImageInitial].', () {
      expect(_cubit.state, isA<ImageInitial>());
    });

    test('Should emit [ImageListingLoading, ImageListingLoaded].', () {
      when(_repository.getImageListing())
          .thenAnswer((realInvocation) async => Future.value(database));

      expectLater(
        _cubit.stream,
        emitsInOrder([
          isA<ImageListingLoading>(),
          isA<ImageListingLoaded>().having(
            (state) => state.showcaseListing.length,
            'length == 8',
            8,
          ),
        ]),
      );

      _cubit.getImageListing();
    });

    test('Should emit [ImageListingLoading, ImageListingNoContent].', () {
      when(_repository.getImageListing())
          .thenAnswer((realInvocation) async => Future.value({'data': null}));

      expectLater(
        _cubit.stream,
        emitsInOrder([
          isA<ImageListingLoading>(),
          isA<ImageListingNoContent>(),
        ]),
      );

      _cubit.getImageListing();
    });

    test('Should emit [ImageListingLoading, ImageListingLoadError].', () {
      when(_repository.getImageListing()).thenThrow(Exception());

      expectLater(
        _cubit.stream,
        emitsInOrder([
          isA<ImageListingLoading>(),
          isA<ImageListingLoadError>(),
        ]),
      );

      _cubit.getImageListing();
    });
  });
}
