import 'dart:js';

import 'package:covid19/utils/helpers/helpers.dart';
import 'package:covid19/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Padding covidCard(
    {BuildContext context,
    int todayData,
    int totalData,
    String svgUrl,
    String title}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        _today(
          context: context,
          todayData: todayData,
        ),
        _total(
          context: context,
          totalData: totalData,
          svgUrl: svgUrl,
          title: title,
        ),
      ],
    ),
  );
}

Container _total(
    {BuildContext context, int totalData, String svgUrl, String title}) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColorDark,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: primaryTextColor.withOpacity(0.64),
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                svgUrl,
                color: Theme.of(context).accentColor.withOpacity(0.64),
                height: MediaQuery.of(context).size.height * 0.05,
                placeholderBuilder: (context) => _onLoading(context),
              ),
              Text(
                Helpers.formatarNumero(totalData),
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Container _today({BuildContext context, int todayData}) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 120, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Today",
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: primaryTextColor.withOpacity(0.64),
                ),
          ),
          Text(
            Helpers.formatarNumero(todayData),
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    ),
  );
}

Padding _onLoading(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
    child: Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).primaryColor,
      ),
    ),
  );
}
