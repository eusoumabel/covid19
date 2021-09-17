import 'package:covid19/app/core/model/Country.dart';
import 'package:covid19/app/core/routes.dart';
import 'package:covid19/app/core/utils/helpers/helpers.dart';
import 'package:covid19/app/core/utils/helpers/native_loading.dart';
import 'package:covid19/app/core/utils/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

class CountryItem extends StatelessWidget {
  final Country country;
  const CountryItem({
    Key? key,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.navigate(
        COUNTRY_ROUTE,
        arguments: country,
      ),
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
                  'images/virus.svg',
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.64),
                  height: MediaQuery.of(context).size.height * 0.07,
                  placeholderBuilder: (context) =>
                      NativeLoading(animating: true),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        country.country,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: primaryTextColor.withOpacity(0.64),
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        Helpers.formatterNumber(country.totalConfirmed),
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
}
