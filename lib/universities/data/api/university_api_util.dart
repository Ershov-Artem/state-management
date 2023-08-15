import 'package:state_management/universities/data/api/service/university_service.dart';
import 'package:state_management/universities/data/data.dart';
import 'package:state_management/universities/domain/domain.dart';

class UniversityApiUtil {
  const UniversityApiUtil(this._service);

  final UniversityService _service;

  Future<List<University>> getUniversity({
    int? limit,
    int? offset,
    required String country,
  }) async {
    final result = await _service.getUniversities(
      country: country,
      limit: limit ?? 10,
      offset: offset ?? 10,
    );
    return UniversityMapper.fromApiList(result);
  }
}
