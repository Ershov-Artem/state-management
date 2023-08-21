import 'package:flutter/cupertino.dart';
import 'package:state_management/universities/domain/domain.dart';
import 'package:state_management/universities/presentation/widgets/widgets.dart';

class UniversityList extends StatelessWidget {
  const UniversityList({
    Key? key,
    required this.universityList,
  }) : super(key: key);

  final List<University> universityList;

  static const _separator = SizedBox(
    height: 16,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ).copyWith(
        top: MediaQuery.of(context).padding.top,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      itemBuilder: (context, index) => UniversityItem(
        university: universityList[index],
      ),
      separatorBuilder: (_, __) => _separator,
      itemCount: universityList.length,
    );
  }
}
