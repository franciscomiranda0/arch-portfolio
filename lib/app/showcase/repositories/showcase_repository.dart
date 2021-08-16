import 'package:arch/app/showcase/repositories/json/database_json.dart';

abstract class ShowcaseRepository {
  Future<Map<String, dynamic>> getImageListing();
  Future<Map<String, dynamic>> getTagListing();
}

class ShowcaseImageRepositoryImplementation implements ShowcaseRepository {
  @override
  Future<Map<String, dynamic>> getImageListing() async {
    return Future.value(database);
  }

  @override
  @deprecated
  Future<Map<String, dynamic>> getTagListing() {
    throw UnimplementedError();
  }
}

class ShowcaseTagRepositoryImplementation implements ShowcaseRepository {
  @override
  @deprecated
  Future<Map<String, dynamic>> getImageListing() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getTagListing() {
    return Future.value(database);
  }
}
