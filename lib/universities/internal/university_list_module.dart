import 'package:state_management/universities/data/data.dart';
import 'package:state_management/universities/domain/domain.dart';

import 'internal.dart';

class UniversityListModule {
  static UniversityApiRepository? _repository;

  static UniversityListModel createUniversityListModel() {
    return UniversityListModel(_repository ??=
        UniversityRepositoryModule.createUniversityRepository());
  }
}
