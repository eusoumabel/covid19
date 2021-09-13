import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../routes.dart';

class EndDrawerItem extends StatelessWidget {
  const EndDrawerItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(canvasColor: Theme.of(context).scaffoldBackgroundColor),
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  "World Cases",
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () => Modular.to.navigate(COUNTRIES_ROUTE),
              ),
              ListTile(
                title: Text(
                  "Search",
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () => Modular.to.navigate(SEARCH_ROUTE),
              ),
              ListTile(
                title: Text(
                  "Other",
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () => Modular.to.navigate(OTHER_ROUTE),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
