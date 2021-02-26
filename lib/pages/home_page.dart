import 'package:covid19/bloc/home_bloc.dart';
import 'package:covid19/components/app_bar.dart';
import 'package:covid19/components/global_data.dart';
import 'package:covid19/components/native_loading.dart';
import 'package:covid19/model/Summary.dart';
import 'package:covid19/service/config/base_response.dart';
import 'package:covid19/utils/helpers/manage_dialogs.dart';
import 'package:covid19/utils/style/animations/fade_animation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc = HomeBloc();
  @override
  void initState() {
    super.initState();
    _bloc.getSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: "World Cases",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<BaseResponse<Summary>>(
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
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///Global
                            FadeAnimation(
                              0.2,
                              _sectionTitle(title: "Global"),
                            ),
                            FadeAnimation(
                              0.3,
                              globalData(
                                context: context,
                                snapshot: snapshot,
                              ),
                            ),

                            ///Countries
                            FadeAnimation(
                              0.4,
                              _sectionTitle(title: "Countries"),
                            ),
                          ],
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
          ],
        ),
      ),
    );
  }

  Padding _sectionTitle({String title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
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
