import 'package:covid19/model/Country.dart';
import 'package:covid19/pages/country_page.dart';
import 'package:covid19/utils/helpers/helpers.dart';
import 'package:covid19/utils/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'native_loading.dart';

Widget countryCard({
  BuildContext context,
  Country country,
}) {
  return GestureDetector(
    onTap: () {
      return Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => CountryPage(
            country: country,
          ),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/virus.svg',
                color: Theme.of(context).accentColor.withOpacity(0.64),
                height: MediaQuery.of(context).size.height * 0.07,
                placeholderBuilder: (context) => _onLoading(),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      country.country,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: primaryTextColor.withOpacity(0.64),
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      Helpers.formatarNumero(country.totalConfirmed),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Padding _onLoading() {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
    child: NativeLoading(animating: true),
  );
}
