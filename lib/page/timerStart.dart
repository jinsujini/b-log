import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

// 책 제목이 입력됐는지
bool isBookSelected = false;
// 선택된 책 제목
String selectedBookTitle = '';
// 책을 선택하면 실행되는 함수
void selectBook(String title) {
  selectedBookTitle = title;
  isBookSelected = true;
}

// 책을 선택하지 않았을 때 나타나는 알림
void selectBookAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("책 제목을 입력하세요"),
        content: Text("시작하기 전에 책 제목을 입력해주세요."),
        actions: <Widget>[
          TextButton(
            child: Text("확인"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class TimerStart extends StatelessWidget {
  const TimerStart({super.key});

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
            // 페이지 제목
            Container(
              width: double.infinity,
              height: 30,
              margin: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                "타이머",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 129, 129, 129),
                ),
              ),
            ),
            // 타이머
            Container(
              margin: EdgeInsets.only(top: 100),
              width: 350,
              height: 330,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 26, 73, 93),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  // 책 제목 입력
                  Container(
                    width: 310,
                    height: 30,
                    margin: EdgeInsets.only(top: 40),
                    child: TextField(
                      textAlign: TextAlign.center, // 텍스트 정렬을 가운데로 설정합니다.
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        selectBook(value);
                      },
                      onChanged: (value) {
                        selectedBookTitle = value;
                        isBookSelected = true;
                      },
                      decoration: InputDecoration(
                        hintText: '책 제목을 입력하세요',
                        border: InputBorder.none, // 밑줄 제거
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // 위젯 사이 여백
                  // 스톱워치
                  TimerScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 스톱워치
class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Timer timer;
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  bool isRun = false;
  bool shouldShowButtons() {
    // 시간이 0이 아니고 실행 중이 아닐 때 true
    return (hours != 0 || minutes != 0 || seconds != 0) && !isRun;
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    return Column(
      children: [
        // 타이머
        Text(
          formattedTime,
          style: TextStyle(
            fontSize: 70,
            fontWeight: FontWeight.w100,
          ),
        ),
        // 버튼(start-stop-save/restart)
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Row(
            // 버튼 가로 정렬
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (!shouldShowButtons())
                ElevatedButton(
                  onPressed: () {
                    if (isBookSelected) {
                      if (isRun) {
                        // 타이머 실행 중일 때
                        setState(() {
                          isRun = false;
                          timer.cancel();
                        });
                      } else {
                        setState(() {
                          // 타이머가 멈춰 있을 때 start 버튼 누르면 타이머 작동함
                          isRun = true;
                          timer = Timer.periodic(Duration(seconds: 1), (timer) {
                            setState(() {
                              if (seconds == 59) {
                                seconds = 0;
                                if (minutes == 59) {
                                  minutes = 0;
                                  hours++;
                                } else {
                                  minutes++;
                                }
                              } else {
                                seconds++;
                              }
                            });
                          });
                        });
                      }
                    } else {
                      // 책이 선택되지 않았을 때 알림을 표시합니다.
                      selectBookAlert(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color.fromARGB(255, 211, 235, 235),
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(41),
                    ),
                  ),
                  child: Text(
                    isRun ? "stop" : "start",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              if (shouldShowButtons())
                ElevatedButton(
                  onPressed: () async {
                    //타이머 시간 저장
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('savedTime', formattedTime);
                    //이전 화면으로 돌아가기
                    Navigator.pop(context, {
                      'time': formattedTime,
                      'bookTitle': selectedBookTitle,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color.fromARGB(255, 211, 235, 235),
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(41),
                    ),
                  ),
                  child: Text(
                    "save",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              if (shouldShowButtons())
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // 타이머가 멈춰 있을 때 restart 버튼 누르면 타이머 작동함
                      isRun = true;
                      timer = Timer.periodic(Duration(seconds: 1), (timer) {
                        setState(() {
                          if (seconds == 59) {
                            seconds = 0;
                            if (minutes == 59) {
                              minutes = 0;
                              hours++;
                            } else {
                              minutes++;
                            }
                          } else {
                            seconds++;
                          }
                        });
                      });
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color.fromARGB(255, 211, 235, 235),
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(41),
                    ),
                  ),
                  child: Text(
                    "restart",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
