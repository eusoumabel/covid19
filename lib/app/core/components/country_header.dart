import 'package:flutter/material.dart';

class CountryHeader extends StatelessWidget {
  final String title;
  final String text;
  const CountryHeader({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title: ",
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
