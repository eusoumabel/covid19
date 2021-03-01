import 'package:covid19/bloc/search_bloc.dart';
import 'package:covid19/components/app_bar.dart';
import 'package:covid19/components/country_card.dart';
import 'package:covid19/components/native_loading.dart';
import 'package:covid19/model/Country.dart';
import 'package:covid19/model/Summary.dart';
import 'package:covid19/services/config/base_response.dart';
import 'package:covid19/utils/helpers/manage_dialogs.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc _bloc = SearchBloc();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _bloc.searchTextController.addListener(() {
      if (this.mounted) {
        setState(() {
          _showClearButton = _bloc.searchTextController.text.length > 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: "Search",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _bloc.searchTextController,
              decoration: InputDecoration(
                hintText: "Country name",
                prefixIcon: IconTheme(
                  data: Theme.of(context).iconTheme,
                  child: Icon(Icons.search),
                ),
                suffixIcon: _getClearButton(),
              ),
              onFieldSubmitted: (value) async {
                if (value.length > 0) {
                  await _bloc.makeSearch(searchText: value);
                }
              },
            ),
          ),
          StreamBuilder<BaseResponse<List<Country>>>(
            initialData: BaseResponse.completed(),
            stream: _bloc.searchStream,
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
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data.data.length,
                          itemBuilder: (context, index) {
                            return countryCard(
                              context: context,
                              country: snapshot.data.data[index],
                            );
                          },
                        ),
                      );
                  }
                } else {
                  return Container();
                }
              } else {
                return Container();
              }
            },
          )
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

  Widget _getClearButton() {
    if (!_showClearButton) {
      return null;
    }
    return IconButton(
      padding: EdgeInsets.only(right: 5, left: 5),
      alignment: Alignment.centerRight,
      icon: IconTheme(
        data: Theme.of(context).iconTheme,
        child: Icon(
          Icons.close,
        ),
      ),
      onPressed: () async {
        setState(() {
          _bloc.clearSearch();
        });
      },
    );
  }
}
