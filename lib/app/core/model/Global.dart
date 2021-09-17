class Global {
  Global({
    required this.newConfirmed,
    required this.totalConfirmed,
    required this.newDeaths,
    required this.totalDeaths,
    required this.newRecovered,
    required this.totalRecovered,
  });
  late final int newConfirmed;
  late final int totalConfirmed;
  late final int newDeaths;
  late final int totalDeaths;
  late final int newRecovered;
  late final int totalRecovered;

  Global.fromJson(Map<String, dynamic> json) {
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['NewConfirmed'] = newConfirmed;
    _data['TotalConfirmed'] = totalConfirmed;
    _data['NewDeaths'] = newDeaths;
    _data['TotalDeaths'] = totalDeaths;
    _data['NewRecovered'] = newRecovered;
    _data['TotalRecovered'] = totalRecovered;
    return _data;
  }
}
