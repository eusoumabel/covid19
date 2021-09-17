import 'package:covid19/app/core/components/country_item.dart';
import 'package:covid19/app/core/components/end_drawer_item.dart';
import 'package:covid19/app/core/model/Country.dart';
import 'package:covid19/app/core/routes.dart';
import 'package:covid19/app/core/services/config/base_response.dart';
import 'package:covid19/app/core/utils/helpers/manage_dialogs.dart';
import 'package:covid19/app/core/utils/helpers/native_loading.dart';
import 'package:covid19/app/modules/search/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchBloc> {
  bool _showClearButton = false;
  @override
  void initState() {
    super.initState();
    controller.searchTextController.addListener(() {
      if (this.mounted) {
        setState(() {
          _showClearButton = controller.searchTextController.text.length > 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () => Modular.to.navigate(COUNTRIES_ROUTE),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Search",
          style: Theme.of(context).textTheme.headline5,
          overflow: TextOverflow.fade,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: controller.searchTextController,
              decoration: InputDecoration(
                hintText: "Name of the country",
                prefixIcon: IconTheme(
                  data: Theme.of(context).iconTheme,
                  child: Icon(Icons.search),
                ),
                suffixIcon: _getClearButton(),
              ),
              onFieldSubmitted: (value) async {
                if (value.length > 0) {
                  await controller.makeSearch(searchText: value);
                }
              },
            ),
          ),
          StreamBuilder<BaseResponse<List<Country>>>(
            initialData: BaseResponse.completed(),
            stream: controller.searchController.stream,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data!.data != null) {
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
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, index) {
                            return CountryItem(
                              country: snapshot.data!.data![index],
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

  Widget? _getClearButton() {
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
          controller.clearSearch();
        });
      },
    );
  }
}
