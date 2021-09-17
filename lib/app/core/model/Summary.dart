import 'Country.dart';
import 'Global.dart';

class Summary {
  Summary({
    required this.global,
    required this.countries,
    required this.date,
  });
  late final Global global;
  late final List<Country> countries;
  late final String date;

  Summary.fromJson(Map<String, dynamic> json) {
    global = Global.fromJson(json['Global']);
    countries =
        List.from(json['Countries']).map((e) => Country.fromJson(e)).toList();
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Global'] = global.toJson();
    _data['Countries'] = countries.map((e) => e.toJson()).toList();
    _data['Date'] = date;
    return _data;
  }
}
