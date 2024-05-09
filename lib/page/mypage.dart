import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

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
                    EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset(
                              'annonymous.jpeg',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Container(child: Text("s0obang")),
                        ],
                      ),
                    ),
                    Column(children: [
                      Container(
                        width: 80,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffB5DDDD),
                        ),
                        margin: EdgeInsets.only(top: 50, left: 10),
                        child: Text(
                          "한줄소개",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Container(
                        child: Text("한 달에 한 권씩"),
                        margin: EdgeInsets.only(top: 20, left: 20),
                      ),
                    ]),
                    Container(
                      margin: EdgeInsets.only(top: 80, left: 50),
                      child: Icon(
                        Icons.edit,
                        color: Color(0xffA0A0A0),
                      ),
                    )
                  ],
                ),

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
                child: Text("my BookLog"),
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
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(color: Color(0xff517E7E), width: 1)),
                  width: double.infinity,
                  height: 200,
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: SearchBar(
                          hintText: "이름으로 친구를 찾아보세요",
                          trailing: [Icon(Icons.search)],
                          constraints: BoxConstraints(
                              maxWidth: 300, maxHeight: 50, minHeight: 40),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 10),
                                child: Image.asset(
                                  'assets/images/anonymous.jpg',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              Container(child: Text("s0obang")),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 10),
                                child: Image.asset(
                                  'assets/images/anonymous.jpg',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "jinsujini",
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                  //사진, 아이디, 한마디
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
