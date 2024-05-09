import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FriendPage extends StatelessWidget {
  final String name;
  final String profileImageUrl;
  final String introduction;

  const FriendPage({
    required this.name,
    required this.profileImageUrl,
    required this.introduction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffFEFCEB),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: SearchBar(
                  hintText: "검색어를 입력하세요",
                  trailing: [Icon(Icons.search)],
                  constraints: BoxConstraints(
                      maxWidth: 350, maxHeight: 50, minHeight: 40),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(color: Color(0xff517E7E), width: 1)),
                width: double.infinity,
                height: 190,
                margin:
                    EdgeInsets.only(top: 40, right: 20, left: 30, bottom: 20),
                child: Row(children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 21, left: 20),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(profileImageUrl),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 28),
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 80,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffB5DDDD),
                        ),
                        margin: EdgeInsets.only(top: 50, left: 20),
                        child: Text(
                          "한줄소개",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 20),
                        child: Text(
                          introduction,
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  )
                ]),

                //사진, 아이디, 한마디
              ),
              Container(
                width: 100,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(192, 255, 166, 114),
                ),
                margin: EdgeInsets.only(right: 210),
                child: Text("BookLog"),
              ),
              Container(
                  width: double.infinity,
                  height: 300,
                  margin: EdgeInsets.all(30),
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                                Border.all(color: Color(0xff517E7E), width: 1)),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                                Border.all(color: Color(0xff517E7E), width: 1)),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                                Border.all(color: Color(0xff517E7E), width: 1)),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                                Border.all(color: Color(0xff517E7E), width: 1)),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
