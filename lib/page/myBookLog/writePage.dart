import 'package:flutter/material.dart';
import 'package:flutter_application_blog/index.dart';
import 'package:flutter_application_blog/page/myBookLog/myBookLog.dart';

class Writepage extends StatelessWidget {
  const Writepage({super.key});

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
      body: Center(
        child: Container(
          width: 400,
          height: 600,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(0x1A, 0x49, 0x5D, 1.0),
              width: 0.4,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 70.0, top: 40.0, right: 70.0),
                width: 200.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Title : ',
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(0x1A, 0x49, 0x5D, 1.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(
                              0x1A, 0x49, 0x5D, 1.0)), // 밑줄 색상 변경
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 70.0, top: 30.0, right: 70.0),
                width: 300.0,
                height: 30.0,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(0x1A, 0x49, 0x5D, 1.0)),
                    ),
                    hintText: '책이름을 검색해 주세요 ',
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    suffixIcon: Icon(Icons.search,
                        color: Color.fromRGBO(0x1A, 0x49, 0x5D, 1.0)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                width: 300,
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(0x1A, 0x49, 0x5D, 1.0),
                    width: 1.0,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: '내용을 입력해 주세요 ',
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => MyBookLog()));
                },
                child: Text(
                  '제출',
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(0x1A, 0x49, 0x5D, 1.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  minimumSize: Size(300.0, 50.0), // 버튼의 최소 크기를 지정합니다.
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
