import 'package:covid19/app/core/model/Country.dart';
import 'package:covid19/app/core/model/Summary.dart';

abstract class ICovidService {
  Future<List<Country>> doSearch({required String searchText});
  Future<Summary> getSummary();
}
