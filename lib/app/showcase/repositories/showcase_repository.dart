import 'package:arch/app/showcase/repositories/json/database_json.dart';

abstract class ShowcaseRepository {
  Future getImageListing();
  Future getTagListing();
}

class ShowcaseImageRepositoryImplementation implements ShowcaseRepository {
  @override
  Future<Map<String, dynamic>> getImageListing() async {
    return await Future.delayed(const Duration(seconds: 1), () => database);
  }

  @override
  @deprecated
  Future getTagListing() {
    throw UnimplementedError();
  }
}

class ShowcaseTagRepositoryImplementation implements ShowcaseRepository {
  @override
  @deprecated
  Future getImageListing() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getTagListing() {
    return Future.value(database);
  }
}
