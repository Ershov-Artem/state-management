import 'package:state_management/universities/data/data.dart';
import 'package:state_management/universities/internal/internal.dart';

class UniversityRepositoryModule {

  static UniversityApiUtil? _apiUtil;

  static createUniversityRepository() {
    return UniversityApiRepository(_apiUtil??=UniversityApiUtilModule.createApiUtil());
  }

}