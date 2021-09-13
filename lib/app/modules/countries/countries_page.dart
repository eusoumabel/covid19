import 'dart:async';

import 'package:covid19/app/core/components/end_drawer_item.dart';
import 'package:covid19/app/core/components/summary_item.dart';
import 'package:covid19/app/core/model/Summary.dart';
import 'package:covid19/app/core/services/config/base_response.dart';
import 'package:covid19/app/core/utils/helpers/helpers.dart';
import 'package:covid19/app/core/utils/helpers/manage_dialogs.dart';
import 'package:covid19/app/core/utils/helpers/native_loading.dart';
import 'package:covid19/app/modules/countries/countries_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends ModularState<CountriesPage, CountriesBloc> {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  @override
  void initState() {
    super.initState();
    controller.getSummary();
  }

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });
    setState(() {
      controller.getSummary();
    });
    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Refresh complete',
            style: Theme.of(context).textTheme.overline!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
          ),
          backgroundColor: Theme.of(context).primaryColorLight,
          action: SnackBarAction(
              label: 'RETRY',
              textColor: Theme.of(context).backgroundColor,
              onPressed: () {
                _refreshIndicatorKey.currentState!.show();
              }),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "World Cases",
          style: Theme.of(context).textTheme.headline5,
          overflow: TextOverflow.fade,
        ),
      ),
      endDrawer: EndDrawerItem(),
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        animSpeedFactor: 1.2,
        springAnimationDurationInMilliseconds: 700,
        color: Theme.of(context).primaryColorDark,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: StreamBuilder<BaseResponse<Summary>>(
          initialData: BaseResponse.completed(),
          stream: controller.summaryController.stream,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.data!.data?.countries != null) {
                switch (snapshot.data?.status) {
                  case Status.LOADING:
                    return NativeLoading(animating: true);
                  case Status.ERROR:
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      ManagerDialogs.showErrorDialog(
                        context,
                        snapshot.data!.message,
                      );
                    });
                    return Container();
                  default:
                    var summary = snapshot.data!.data;
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: [
                          Text(
                            "Last Updated: " +
                                Helpers.formatterDateAndTimeFromAPI(
                                    summary!.date),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                SummaryItem(
                                  title: "Total Cases",
                                  imagePath: 'virus',
                                  todayData: summary.global.newConfirmed,
                                  totalData: summary.global.totalConfirmed,
                                ),
                                SummaryItem(
                                  title: "Total Deaths",
                                  imagePath: 'death',
                                  todayData: summary.global.newDeaths,
                                  totalData: summary.global.totalDeaths,
                                ),
                                SummaryItem(
                                  title: "Total Recovered",
                                  imagePath: 'success',
                                  todayData: summary.global.newRecovered,
                                  totalData: summary.global.totalRecovered,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                }
              } else {
                return NativeLoading(animating: true);
              }
            } else {
              return NativeLoading(animating: true);
            }
          },
        ),
      ),
    );
  }
}
