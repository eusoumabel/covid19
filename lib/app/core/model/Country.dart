class Country {
  Country({
    required this.country,
    required this.countryCode,
    required this.slug,
    required this.newConfirmed,
    required this.totalConfirmed,
    required this.newDeaths,
    required this.totalDeaths,
    required this.newRecovered,
    required this.totalRecovered,
    required this.date,
  });
  late final String country;
  late final String countryCode;
  late final String slug;
  late final int newConfirmed;
  late final int totalConfirmed;
  late final int newDeaths;
  late final int totalDeaths;
  late final int newRecovered;
  late final int totalRecovered;
  late final String date;

  Country.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    countryCode = json['CountryCode'];
    slug = json['Slug'];
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Country'] = country;
    _data['CountryCode'] = countryCode;
    _data['Slug'] = slug;
    _data['NewConfirmed'] = newConfirmed;
    _data['TotalConfirmed'] = totalConfirmed;
    _data['NewDeaths'] = newDeaths;
    _data['TotalDeaths'] = totalDeaths;
    _data['NewRecovered'] = newRecovered;
    _data['TotalRecovered'] = totalRecovered;
    _data['Date'] = date;
    return _data;
  }
}
