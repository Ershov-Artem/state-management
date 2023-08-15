import 'package:state_management/universities/data/data.dart';
import 'package:state_management/universities/domain/domain.dart';

class UniversityMapper {
  static University fromApi(ApiUniversity api) => University(
        name: api.name,
        country: api.country,
      );

  static List<University> fromApiList(List<ApiUniversity> apiList) =>
      apiList.map((api) => UniversityMapper.fromApi(api)).toList();
}
