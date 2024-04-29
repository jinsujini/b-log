import 'package:flutter/material.dart';

class FriendPage extends StatelessWidget {
  const FriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffFEFCEB),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: Color(0xff517E7E), width: 1)),
              width: double.infinity,
              height: 690,
              margin: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
              child: Row(children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/anonymous.jpg',
                      width: 80,
                      height: 90,
                    ),
                    Container(child: Text("s0obang")),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/gray.jpg',
                      width: 120,
                      height: 190,
                    ),
                  ],
                )
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
