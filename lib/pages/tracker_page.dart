import 'dart:async';

import 'package:covid19/bloc/home_bloc.dart';
import 'package:covid19/components/app_bar.dart';
import 'package:covid19/components/covid_card.dart';
import 'package:covid19/components/native_loading.dart';
import 'package:covid19/model/Summary.dart';
import 'package:covid19/services/config/base_response.dart';
import 'package:covid19/utils/helpers/helpers.dart';
import 'package:covid19/utils/helpers/manage_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class TrackerPage extends StatefulWidget {
  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  HomeBloc _bloc = HomeBloc();
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
        title: "Dados do Mundo",
      ),
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        animSpeedFactor: 1.2,
        springAnimationDurationInMilliseconds: 700,
        color: Theme.of(context).primaryColorDark,
        backgroundColor: Theme.of(context).accentColor,
        child: Center(
          child: SingleChildScrollView(
            child: StreamBuilder<BaseResponse<Summary>>(
              initialData: BaseResponse.completed(),
              stream: _bloc.summaryStream,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  if (snapshot.data.data != null) {
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
                        return _finalBody(snapshot: snapshot);
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
        ),
      ),
    );
  }

  Padding _finalBody({AsyncSnapshot<BaseResponse<Summary>> snapshot}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///Global
          Text(
            "Atualizado em: " +
                Helpers.formatterDateAndTimeFromAPI(snapshot.data.data.date),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          //total cases
          covidCard(
            context: context,
            title: "Total de Casos",
            svgUrl: 'assets/images/virus.svg',
            totalData: snapshot.data.data.global.totalConfirmed,
            todayData: snapshot.data.data.global.newConfirmed,
          ),
          //total deaths
          covidCard(
            context: context,
            title: "Total de Mortes",
            svgUrl: 'assets/images/death.svg',
            totalData: snapshot.data.data.global.totalDeaths,
            todayData: snapshot.data.data.global.newDeaths,
          ),
          //total recovered
          covidCard(
            context: context,
            title: "Total de Recuperações",
            svgUrl: 'assets/images/success.svg',
            totalData: snapshot.data.data.global.totalRecovered,
            todayData: snapshot.data.data.global.newRecovered,
          ),
        ],
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
