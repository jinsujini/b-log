import 'package:flutter/material.dart';
import 'package:flutter_application_blog/index.dart';

class DetailContent extends StatefulWidget {
  const DetailContent({Key? key}) : super(key: key);

  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 200,
        height: 230,
        child: Image.asset(
          'assets/city.jpeg',
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "책이름 입니다요",
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      Image.asset(
        'assets/star.png',
        fit: BoxFit.cover,
      ),
      Text(
        "지은이 블라블ㅇ라닝러미ㅏㄴㄹㅇ",
        style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
      ),
      Divider(
        color: Colors.grey,
        thickness: 1,
        height: 20,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "구의증명 쩐다 !",
        style: TextStyle(
            fontWeight: FontWeight.w700, color: Colors.black, fontSize: 20),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        width: 300,
        child: Text(
          '독후감 적기 끄저ㅣ남어리ㅏ먼ㅇㄹ ㅣ얾이ㅏ나ㅓㄹ미ㅏ',
          style: TextStyle(fontSize: 16),
        ),
      )
    ]));
  }
}

class Booklogdetails extends StatefulWidget {
  const Booklogdetails({super.key});

  @override
  State<Booklogdetails> createState() => _BooklogdetailsState();
}

class _BooklogdetailsState extends State<Booklogdetails> {
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
          child: Column(children: [
        SearchBar(
          trailing: [
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ],
          hintText: "검색어를 입력하세요",
          constraints: BoxConstraints(maxWidth: 360, maxHeight: 40),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
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
            child: DetailContent(),
          ),
        ),
      ])),
    );
  }
}
