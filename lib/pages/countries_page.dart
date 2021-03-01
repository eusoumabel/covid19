import 'dart:async';

import 'package:covid19/bloc/countries_bloc.dart';
import 'package:covid19/components/app_bar.dart';
import 'package:covid19/components/country_card.dart';
import 'package:covid19/components/native_loading.dart';
import 'package:covid19/model/Summary.dart';
import 'package:covid19/services/config/base_response.dart';
import 'package:covid19/utils/helpers/helpers.dart';
import 'package:covid19/utils/helpers/manage_dialogs.dart';
import 'package:covid19/utils/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  CountriesBloc _bloc = CountriesBloc();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  @override
  void initState() {
    super.initState();
    _bloc.getSummary();
  }

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });
    setState(() {
      _bloc.getSummary();
    });
    return completer.future.then<void>((_) {
      _scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              }),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: "Cases",
      ),
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        animSpeedFactor: 1.2,
        springAnimationDurationInMilliseconds: 700,
        color: Theme.of(context).primaryColorDark,
        backgroundColor: Theme.of(context).accentColor,
        child: StreamBuilder<BaseResponse<Summary>>(
          initialData: BaseResponse.completed(),
          stream: _bloc.summaryStream,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.data.data?.countries != null) {
                switch (snapshot.data?.status) {
                  case Status.LOADING:
                    return _onLoading();
                    break;
                  case Status.ERROR:
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ManagerDialogs.showErrorDialog(
                        context,
                        snapshot.data.message,
                      );
                    });
                    return Container();
                    break;
                  default:
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: [
                          Text(
                            "Last Updated: " +
                                Helpers.formatterDateAndTimeFromAPI(
                                    snapshot.data.data.date),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data.data.countries.length,
                              itemBuilder: (context, index) {
                                return countryCard(
                                  context: context,
                                  country: snapshot.data.data.countries[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                }
              } else {
                return _onLoading();
              }
            } else {
              return _onLoading();
            }
          },
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
}
