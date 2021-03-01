import 'package:covid19/components/app_bar.dart';
import 'package:covid19/components/covid_card.dart';
import 'package:covid19/model/Country.dart';
import 'package:covid19/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  final Country country;

  const CountryPage({Key key, this.country}) : super(key: key);
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: widget.country.country),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                "Atualizado em: " +
                    Helpers.formatterDateAndTimeFromAPI(widget.country.date),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _countryDescription(),
            ),
            //total cases
            covidCard(
              context: context,
              title: "Total de Casos",
              svgUrl: 'assets/images/virus.svg',
              totalData: widget.country.totalConfirmed,
              todayData: widget.country.newConfirmed,
            ),
            //total deaths
            covidCard(
              context: context,
              title: "Total de Mortes",
              svgUrl: 'assets/images/death.svg',
              totalData: widget.country.totalDeaths,
              todayData: widget.country.newDeaths,
            ),
            //total recovered
            covidCard(
              context: context,
              title: "Total de Recuperações",
              svgUrl: 'assets/images/success.svg',
              totalData: widget.country.totalRecovered,
              todayData: widget.country.newRecovered,
            ),
          ],
        ),
      ),
    );
  }

  Container _countryDescription() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _countryDescriptionItem(
              title: "País",
              text: widget.country.country,
            ),
            _countryDescriptionItem(
              title: "Variante de Nome",
              text: widget.country.slug,
            ),
            _countryDescriptionItem(
              title: "Código",
              text: widget.country.countryCode,
            ),
          ],
        ),
      ),
    );
  }

  Widget _countryDescriptionItem({String title, String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title:",
            style: Theme.of(context).textTheme.headline6,
          ),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
