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
              currentCountry: Countries.Armenia,
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

class _UniversitiesView extends StatefulWidget {
  const _UniversitiesView({
    super.key,
  });

  @override
  State<_UniversitiesView> createState() => _UniversitiesViewState();
}

class _UniversitiesViewState extends State<_UniversitiesView> {
  @override
  void initState() {
    super.initState();
    context.read<UniversityListModel>().addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<University>>(
        future: context.read<UniversityListModel>().universities,
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
