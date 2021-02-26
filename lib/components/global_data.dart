import 'package:covid19/model/Summary.dart';
import 'package:covid19/service/config/base_response.dart';
import 'package:covid19/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

Padding globalData(
    {BuildContext context, AsyncSnapshot<BaseResponse<Summary>> snapshot}) {
  Map<String, dynamic> _itens = {
    "New confirmed": snapshot.data.data.global.newConfirmed,
    "Total confirmed": snapshot.data.data.global.totalConfirmed,
    "New deaths": snapshot.data.data.global.newDeaths,
    "Total deaths": snapshot.data.data.global.totalDeaths,
    "New recovered": snapshot.data.data.global.newRecovered,
    "Total recovered": snapshot.data.data.global.totalRecovered,
  };
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(15),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _itens.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            String subtitle = _itens.keys.elementAt(index);
            return _globalRowData(
              context: context,
              subtitle: subtitle,
              data: Helpers.formatarNumero(_itens[subtitle]),
            );
          },
        ),
      ),
    ),
  );
}

Widget _globalRowData({String subtitle, String data, BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        Text(
          "$subtitle:",
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            data,
            style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 15),
          ),
        ),
      ],
    ),
  );
}
