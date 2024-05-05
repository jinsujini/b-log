import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_blog/index.dart';

/// 첫 번째 페이지
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Timer? timer;
  PageController controller = PageController(
    // controller 선언
    initialPage: 0, // 몇번째 page 부터 시작할래
  );

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 4), (timer) {
      int currentPage = controller.page!.toInt(); //현재 화면
      int nextPage = currentPage + 1; // 다음 화면

      if (nextPage > 2) {
        // page 끝에 도달시 첫화면으로 돌아감.
        nextPage = 0;
      }
      controller.animateToPage(nextPage, // 다음페이지로 넘겨.
          duration: Duration(milliseconds: 400), // 이동하는 속도
          curve: Curves.linear // 동일한 속도
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: SearchBar(
                      trailing: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ],
                      elevation: WidgetStatePropertyAll(0),
                      side: WidgetStatePropertyAll(
                          BorderSide(color: Colors.black, width: 1)),
                      hintText: "검색어를 입력하세요",
                      constraints: BoxConstraints(maxWidth: 360, maxHeight: 40),
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      width: 600,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: PageView(
                          controller: controller, //controller 로 PageVIew 조정 가능
                          children: [
                            Image.asset('assets/city.jpeg', fit: BoxFit.cover),
                            Image.asset('assets/city.jpeg', fit: BoxFit.cover),
                            Image.asset('assets/city.jpeg', fit: BoxFit.cover),
                          ]),
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 20,
                    child: Text(
                      "friend’s new-log",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        width: 400,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/Vector.png',
                                    fit: BoxFit.fill),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("yeonii"),
                                      Text(
                                        "2024.3.2",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Text(
                                        "제목",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      Text(
                                        "작가",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      Text(
                                        "내용 미리보기블라\n블라브라",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                    width: 100,
                                    height: 150,
                                    child: Image.asset('assets/city.jpeg',
                                        fit: BoxFit.cover),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: 370,
                      height: 50,
                      child: Text(
                        "your contributions in March",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7,
                                  mainAxisSpacing: 3,
                                  crossAxisSpacing: 3),
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                              child: Text(
                                "mon",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                              child: Text(
                                "tue",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                              child: Text(
                                "wed",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                              child: Text(
                                "thu",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                              child: Text(
                                "fry",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                              child: Text(
                                "sta",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                              child: Text(
                                "sun",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              color: Colors.white,
                            ),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(96, 142, 142, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(68, 102, 102, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(181, 221, 221, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(114, 185, 185, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(215, 223, 223, 1.0),
                                  borderRadius:
                                      BorderRadius.circular(10), // 둥근 테두리 설정
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
