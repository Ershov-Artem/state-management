import 'package:state_management/universities/domain/domain.dart';

abstract class UniversityRepository {
  Future<List<University>> getUniversities({
    int? limit,
    int? offset,
    required String country,
  });
}
