import 'package:flutter/material.dart';
import 'package:flutter_application_blog/page/timerStart.dart';

class TimerMain extends StatefulWidget {
  @override
  _TimerMainState createState() => _TimerMainState();
}

class _TimerMainState extends State<TimerMain> {
  List<String?> timeInfo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffFEFCEB),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 30,
              margin: EdgeInsets.only(left: 35, top: 30, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 페이지 제목
                  Text(
                    "타이머",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 129, 129, 129),
                    ),
                  ),
                  // add 버튼
                  Container(
                    margin: EdgeInsets.only(right: 35),
                    //버튼 그림자 넣는게 좋을지
                    /*decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(1, 10), // changes position of shadow
                        ),
                      ],
                    ),*/
                    child: GestureDetector(
                      onTap: () async {
                        // TimerStart 화면으로 이동하고 결과를 받아옴
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TimerStart()),
                        );
                        // TimerStart 화면에서 반환된 값으로 formattedTimes에 추가
                        setState(() {
                          if (result != null) {
                            timeInfo.add(result['time']);
                            timeInfo.add(result['bookTitle']);
                            timeInfo.add(result['bookmarks']);
                          }
                        });
                      },
                      child: Icon(
                        Icons.add_box,
                        size: 40,
                        color: Color.fromARGB(255, 211, 235, 235),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 저장된 시간 표시
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < timeInfo.length; i++)
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: 350,
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 26, 73, 93),
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10, left: 15),
                              child: Text(
                                "${timeInfo[i]}",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, right: 15),
                              child: Text(
                                "${timeInfo[++i]}/${timeInfo[++i]}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
