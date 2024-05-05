import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_blog/index.dart';
import 'package:flutter_application_blog/page/writePage.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.edit, color: Colors.grey),
              Icon(Icons.delete, color: Colors.grey),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 200,
                  child: Image.asset('assets/city.jpeg', fit: BoxFit.cover),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(181, 221, 221, 1.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '구의증명',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "구의증명 넘 재밋서효 감동적 sdfasdfasdfasdfdsfsdcsdcasdf",
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class MyBookLog extends StatelessWidget {
  const MyBookLog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Center(
        child: Container(
            width: 370,
            height: 650,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromRGBO(0x1A, 0x49, 0x5D, 1.0),
                  width: 0.4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 5),
                  ),
                ],
                color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyContainer(),
                  MyContainer(),
                  MyContainer(),
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(244, 103, 1, 1.0),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Writepage()));
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
