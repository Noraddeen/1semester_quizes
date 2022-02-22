import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Container(
            height: 150,
            width: width,
            padding: EdgeInsets.only(top: 25),
            color: Colors.deepPurple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Profile Settings",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 55,
            margin: EdgeInsets.only(bottom: 80),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 150,
                  bottom: -60,
                  child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white24),
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                      ),
                      child: Icon(
                        Icons.account_circle,
                        size: 60,
                        color: Colors.grey,
                      )),
                )
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                    width: width, child: Center(child: Text("Augusta F"))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: width,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("augusta@yayapay"), Icon(Icons.copy)],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 60,
                thickness: 2,
                color: Colors.grey[300],
              ),
              Center(
                child: Info(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 300,
              child: InfoItem(
                  icon: Icons.email_outlined,
                  firstStr: "'Email : PersonW@example.com'",
                  secondStr: 'facebook : PersonW@example.com'),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 300,
              child: InfoItem(
                  icon: Icons.email_outlined,
                  firstStr: "'Email : PersonW@example.com'",
                  secondStr: 'facebook : PersonW@example.com'),
            ),
          ],
        ));
  }
}

class InfoItem extends StatelessWidget {
  InfoItem({this.icon, this.secondStr, this.firstStr, Key? key})
      : super(key: key);
  late IconData? icon;
  late String? secondStr;
  late String? firstStr;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 50, child: Icon(icon)),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Text("$firstStr"),
              onTap: () {},
            ),
            InkWell(
              child: Text("$secondStr"),
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}
