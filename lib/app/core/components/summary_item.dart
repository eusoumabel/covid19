import 'package:covid19/app/core/utils/helpers/helpers.dart';
import 'package:covid19/app/core/utils/helpers/native_loading.dart';
import 'package:covid19/app/core/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SummaryItem extends StatelessWidget {
  final int todayData;
  final int totalData;
  final String imagePath;
  final String title;
  const SummaryItem({
    Key? key,
    required this.todayData,
    required this.totalData,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
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
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: primaryTextColor.withOpacity(0.64),
                        ),
                  ),
                  Text(
                    Helpers.formatterNumber(todayData),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ),
          Container(
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
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: primaryTextColor.withOpacity(0.64),
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "images/$imagePath.svg",
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.64),
                        height: MediaQuery.of(context).size.height * 0.05,
                        placeholderBuilder: (context) =>
                            NativeLoading(animating: true),
                      ),
                      Text(
                        Helpers.formatterNumber(totalData),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
