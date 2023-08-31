import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/universities/domain/domain.dart';
import 'package:state_management/universities/internal/internal.dart';
import 'package:state_management/universities/presentation/widgets/widgets.dart';

class UniversitiesPage extends StatelessWidget {
  const UniversitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          UniversityListModule.createUniversityListModel()
            ..fetchUniversitiesByCountry(Countries.Armenia),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Choose country'),
          leading: CountriesWidget(
              currentCountry: context.watch<UniversityListModel>().country,
              onChange: (value) {
                context
                    .read<UniversityListModel>()
                    .fetchUniversitiesByCountry(value);
              }),
        ),
        body: child,
      ),
      child: const _UniversitiesView(),
    );
  }
}

class _UniversitiesView extends StatelessWidget {
  const _UniversitiesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<University>>(
        future: context.watch<UniversityListModel>().universities,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.isNotEmpty ?? false) {
              return UniversityList(universityList: snapshot.data!);
            } else {
              return const Center(child: Text('EmptyResponse'));
            }
          } else if (snapshot.hasError) {
            return Center(child: Text('Error ${snapshot.error?.toString()}'));
          } else {
            return const Center(child: Text('loading'));
          }
        });
  }
}
