import 'package:covid19/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc.getSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
