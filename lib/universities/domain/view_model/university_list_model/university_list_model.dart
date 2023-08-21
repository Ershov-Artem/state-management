import 'package:flutter/cupertino.dart';
import 'package:state_management/universities/domain/domain.dart';

class UniversityListModel extends ChangeNotifier {
  UniversityListModel(this._repository);

  final UniversityRepository _repository;

  Countries _country = Countries.Armenia;

  Countries get country => _country;

  Future<List<University>>? _universitiesList;

  Future<List<University>>? get universities => _universitiesList;

  static const _limit = 10;

  int _offset = 0;

  Future<void> fetchUniversitiesByCountry(Countries value) async {
    _country = value;
    _offset = 0;
    await _fetchUniversityList();
  }

  Future<void> fetchMoreUniversities() async {
    _offset += _limit;
    await _fetchUniversityList();
  }

  Future<void> _fetchUniversityList() async {
    _universitiesList = _repository.getUniversities(
        country: _country.name, limit: _limit, offset: _offset).whenComplete(() {
          notifyListeners();});
  }


}
