import 'package:flutter/material.dart';
import 'package:flutter_application_blog/page/timer/timerStart.dart';

class TimerMain extends StatefulWidget {
  const TimerMain({super.key});

  @override
  _TimerMainState createState() => _TimerMainState();
}

class _TimerMainState extends State<TimerMain> {
  List<String?> formattedTime = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffFEFCEB),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 페이지 제목
            Container(
              width: double.infinity,
              height: 30,
              margin: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                "타이머",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 129, 129, 129),
                ),
              ),
            ),
            // 저장된 시간 표시
            for (int i = 0; i < formattedTime.length; i++)
              Container(
                margin: EdgeInsets.only(top: i == 0 ? 50 : 20),
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 26, 73, 93),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Text(
                    "${formattedTime[i]}",
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),

            // add 버튼
            Container(
              margin: EdgeInsets.only(
                  top: formattedTime != null
                      ? 300
                      : 200), // formattedTime에 따라 margin 조정
              width: 103,
              height: 41,
              child: ElevatedButton(
                onPressed: () async {
                  // TimerStart 화면으로 이동하고 결과를 받아옴
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TimerStart()),
                  );

                  // TimerStart 화면에서 반환된 값으로 formattedTimes에 추가
                  setState(() {
                    formattedTime.add(result);
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 211, 235, 235),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(41),
                  ),
                ),
                child: const Text(
                  "add",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
