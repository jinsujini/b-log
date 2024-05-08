import 'package:flutter/material.dart';
import 'package:flutter_application_blog/page/findFriend.dart';
import 'package:flutter_application_blog/page/mainPage.dart';
import 'package:flutter_application_blog/page/myBookLog.dart';
import 'package:flutter_application_blog/page/mypage.dart';
import 'package:flutter_application_blog/page/timerMain.dart';

Color backColor = const Color(0xFFFEFCEB);
Color lineColor = const Color(0xFF517E7E);

class logo extends StatelessWidget {
  const logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
          backgroundColor: backColor,
          centerTitle: true,
          elevation: 0,
          title: Image.asset(
            'assets/logo.png',
            width: 100,
            height: 100,
          )),
    );
  }
}

class btnb extends StatefulWidget {
  const btnb({super.key});

  @override
  State<btnb> createState() => _btnbState();
}

class _btnbState extends State<btnb> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex, // index 순서에 해당하는 child를 맨 위에 보여줌
        children: [
          const Friends(),
          TimerMain(),
          const MyBookLog(),
          const Friends(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // 현재 보여주는 탭
        onTap: (newIndex) {
          // 다른 페이지로 이동
          setState(() {
            currentIndex = newIndex;
          });
        },
        selectedItemColor: Colors.black, // 선택된 아이콘 색상
        unselectedItemColor: Colors.black, // 선택되지 않은 아이콘 색상
        showSelectedLabels: false, // 선택된 항목 label 숨기기
        showUnselectedLabels: false, // 선택되지 않은 항목 label 숨기기
        type: BottomNavigationBarType.fixed, // 선택시 아이콘 움직이지 않기
        backgroundColor: backColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.people, size: 40), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.timer, size: 40), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 40), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.edit, size: 40), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 40), label: "")
        ],
      ),
    );
  }
}

class index extends StatefulWidget {
  const index({super.key});

  @override
  State<index> createState() => _indexState();
}

class _indexState extends State<index> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppListPage(),
    );
  }
}

class AppListPage extends StatefulWidget {
  const AppListPage({super.key});

  @override
  State<AppListPage> createState() => _AppListPageState();
}

class _AppListPageState extends State<AppListPage> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
          backgroundColor: backColor,
          centerTitle: true,
          elevation: 0,
          title: Image.asset(
            'assets/logo.png',
            width: 100,
            height: 100,
          )),
      body: IndexedStack(
        index: currentIndex, // index 순서에 해당하는 child를 맨 위에 보여줌
        children: [
          const Friends(),
          TimerMain(),
          const MainPage(),
          const MyBookLog(),
          const MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // 현재 보여주는 탭
        onTap: (newIndex) {
          // 다른 페이지로 이동
          setState(() {
            currentIndex = newIndex;
          });
        },
        selectedItemColor: Colors.black, // 선택된 아이콘 색상
        unselectedItemColor: Colors.black, // 선택되지 않은 아이콘 색상
        showSelectedLabels: false, // 선택된 항목 label 숨기기
        showUnselectedLabels: false, // 선택되지 않은 항목 label 숨기기
        type: BottomNavigationBarType.fixed, // 선택시 아이콘 움직이지 않기
        backgroundColor: backColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.people, size: 40), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.timer, size: 40), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 40), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.edit, size: 40), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 40), label: "")
        ],
      ),
    );
  }
}

/// 세 번째 페이지
class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: const Center(),
    );
  }
}

/// 네 번째 페이지
class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: const Center(),
    );
  }
}

/// 다섯 번째 페이지
class FifththPage extends StatelessWidget {
  const FifththPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: const Center(),
    );
  }
}
