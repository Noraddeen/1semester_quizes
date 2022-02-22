// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_app/items%20select.dart';
import 'package:flutter_new_app/profile.dart';

import 'flights.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

const List<Tab> tabs = <Tab>[
  Tab(text: 'FLIGHTS'),
  Tab(text: 'TRAIN'),
  Tab(text: 'BUS'),
  Tab(text: 'HOTEL'),
];

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 0,
            elevation: 0,
            bottom: const TabBar(
              padding: EdgeInsets.only(left: 10, right: 100),
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.only(bottom: 0),
              indicatorPadding: EdgeInsets.only(top: 0),
              indicatorColor: Colors.deepPurple,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              tabs: tabs,
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: const TabBarView(children: [
              Flights(),
              ItemSelected(),
              Profile(),
              Text("forth "),
            ]),
          ),
        );
      }),
    );
  }
}
