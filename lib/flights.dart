// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input.dart';

class Flights extends StatefulWidget {
  const Flights({Key? key}) : super(key: key);

  @override
  _FlightsState createState() => _FlightsState();
}

class _FlightsState extends State<Flights> {
  @override
  List<Inputs> str = [
    Inputs("Origin", "San Framcicco", "SFO"),
    Inputs("Origin", "San Framcicco", "SFO"),
    Inputs("Origin", "San Framcicco", ""),
    Inputs("Origin", "San Framcicco", ""),
    Inputs("Origin", "San Framcicco", ""),
    Inputs("Origin", "San Framcicco", ""),
  ];
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            input(str[0]),
            input(str[1]),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: input(str[2]),
                ),
                Expanded(
                  flex: 1,
                  child: input(str[3]),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: input(str[4]),
                ),
                Expanded(
                  flex: 1,
                  child: input(str[5]),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
                ),
                child: Text(
                  "SEARCH",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget input(Inputs wid) {
    return Container(
      margin: EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(wid.label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: wid.placeholder,
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                suffixIcon: SizedBox(
                  height: 30,
                  width: 30,
                  child: Center(child: Text(wid.rightSide)),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black12,
                      width: 2,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10),
                )),
          )
        ],
      ),
    );
  }
}
