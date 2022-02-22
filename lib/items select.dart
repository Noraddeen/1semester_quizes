// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemSelected extends StatefulWidget {
  const ItemSelected({Key? key}) : super(key: key);

  @override
  _ItemSelectedState createState() => _ItemSelectedState();
}

class _ItemSelectedState extends State<ItemSelected> {
  List<Items> items = [
    Items("assets/images/1.jpg", "nice clothes", 100.0, 1),
    Items("assets/images/1.jpg", "dark shirtes", 20.0, 1),
    Items("assets/images/1.jpg", "nice clothes", 32.0, 1),
  ];

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.grey[200],
            child: Row(
              // TabBar
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.keyboard_arrow_down)),
                Text("Cards"),
                Text("${items.length} Items"),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.indigoAccent),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
                  ),
                  child: Text(
                    "checkout".toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: items.map((item) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        items.remove(item);
                        setState(() {});
                      },
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      width: 70,
                      child: Stack(
                        // stack here
                        children: [
                          Positioned(
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 10,
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(5),
                              height: 30,
                              child: DropdownButton<int>(
                                value: item.number,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 15,
                                elevation: 10,
                                style:
                                    const TextStyle(color: Colors.deepPurple),
                                // underline: Container(
                                //   height: 2,
                                //   color: Colors.deepPurpleAccent,
                                // ),
                                onChanged: (newValue) {
                                  setState(() {
                                    item.number = newValue!;
                                  });
                                },
                                items: <int>[1, 2, 3, 4, 5].map((int value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text("$value"),
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text("${item.des}"),
                        ),
                        Text("${item.price}"),
                      ],
                    ),
                  )
                ],
              );
            }).toList(),
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  info("Products: ", "x${getNumber()}"),
                  info("Total:", "\$${getPrice()}"),
                ],
              ),
            ),
          ),
          TextButton(
              style: ButtonStyle(
                //fixedSize: MaterialStateProperty.all(value),
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                    horizontal: width / 2 - 20 - 25, vertical: 15)),
              ),
              onPressed: () {
                items.clear();
                setState(() {});
              },
              child: Text(
                "Clear Data",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  double getPrice() {
    double total = 0;
    for (int i = 0; i < items.length; i++) {
      total += items[i].price * items[i].number;
    }
    return total;
  }

  double getNumber() {
    double total = 0;
    for (int i = 0; i < items.length; i++) {
      total += items[i].number;
    }
    return total;
  }
}

Widget info(String key, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "$key",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      Text("$value"),
    ],
  );
}

class Items {
  late String image;
  late String des;
  late double price;
  late int number;

  Items(this.image, this.des, this.price, this.number);
}
