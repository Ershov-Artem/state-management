import 'package:state_management/universities/data/data.dart';

class UniversityApiUtilModule {
  static UniversityService? _service;

  static UniversityApiUtil createApiUtil() {
    return UniversityApiUtil(_service??=UniversityService());
  }
}