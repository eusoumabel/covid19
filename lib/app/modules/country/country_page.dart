import 'package:covid19/app/core/components/country_header.dart';
import 'package:covid19/app/core/components/summary_item.dart';
import 'package:covid19/app/core/model/Country.dart';
import 'package:covid19/app/core/routes.dart';
import 'package:covid19/app/core/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'country_bloc.dart';

class CountryPage extends StatefulWidget {
  final Country country;

  const CountryPage({
    Key? key,
    required this.country,
  }) : super(key: key);
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends ModularState<CountryPage, CountryBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () => Modular.to.navigate(SEARCH_ROUTE),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          widget.country.country,
          style: Theme.of(context).textTheme.headline5,
          overflow: TextOverflow.fade,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  "Last Updated: " +
                      Helpers.formatterDateAndTimeFromAPI(widget.country.date),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CountryHeader(
                          title: "Country",
                          text: widget.country.country,
                        ),
                        CountryHeader(
                          title: "Slug",
                          text: widget.country.slug,
                        ),
                        CountryHeader(
                          title: "Code",
                          text: widget.country.countryCode,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SummaryItem(
                title: "Total Cases",
                imagePath: 'virus',
                totalData: widget.country.totalConfirmed,
                todayData: widget.country.newConfirmed,
              ),
              SummaryItem(
                title: "Total Deaths",
                imagePath: 'death',
                totalData: widget.country.totalDeaths,
                todayData: widget.country.newDeaths,
              ),
              SummaryItem(
                title: "Total Recovered",
                imagePath: 'success',
                totalData: widget.country.totalRecovered,
                todayData: widget.country.newRecovered,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
