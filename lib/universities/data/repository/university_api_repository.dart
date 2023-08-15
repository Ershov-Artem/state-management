import 'package:state_management/universities/data/data.dart';
import 'package:state_management/universities/domain/domain.dart';

class UniversityApiRepository implements UniversityRepository {
  const UniversityApiRepository(this._apiUtil);

  final UniversityApiUtil _apiUtil;

  @override
  Future<List<University>> getUniversities(
      {int? limit, int? offset, required String country}) async {
    return _apiUtil.getUniversity(
      country: country,
      limit: limit,
      offset: offset,
    );
  }
}
