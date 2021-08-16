import 'package:arch/app/showcase/blocs/image_cubit/image_cubit.dart';
import 'package:arch/app/showcase/repositories/json/database_json.dart';
import 'package:arch/app/showcase/repositories/showcase_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SpyImageRepositoryImplementation extends Mock
    implements ShowcaseImageRepositoryImplementation {}

void main() {
  late final ImageCubit _cubit;
  late final ShowcaseRepository _repository;

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

    test('Should emit [ImageListingLoading, ImageListingLoaded].', () async {
      when(_repository.getImageListing())
          .thenAnswer((realInvocation) => Future.value(database));

      expectLater(
        _cubit.stream,
        emitsInOrder([
          isA<ImageListingLoading>(),
          isA<ImageListingLoaded>(),
        ]),
      );

      await _cubit.getImageListing();
    });
  });
}
