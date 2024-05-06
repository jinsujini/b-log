import 'package:flutter/material.dart';
import 'package:flutter_application_blog/index.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/profile_image.png'), // 프로필 이미지 설정
      radius: 50, // 프로필 아이콘의 반지름 설정
    );
  }
}

class FriendContainer extends StatelessWidget {
  const FriendContainer({super.key});

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 45, width: 45, child: ProfileWidget()),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  'nickname',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '2024.05.05',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 200,
                          child: Image.asset('assets/city.jpeg',
                              fit: BoxFit.cover),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 25),
                                Icon(Icons.star,
                                    size: 15, color: Colors.black), // 별표 아이콘
                                Icon(Icons.star, size: 15, color: Colors.black),
                                Icon(Icons.star, size: 15, color: Colors.black),
                                Icon(Icons.star_half_outlined,
                                    size: 15, color: Colors.black),
                                Icon(Icons.star_border_outlined,
                                    size: 15, color: Colors.black),
                                SizedBox(width: 30), // 간격 조절
                                Icon(Icons.favorite,
                                    size: 25, color: Colors.black), // 하트 아이콘
                              ],
                            ),
                          ],
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

class FriendBookLog extends StatelessWidget {
  const FriendBookLog({Key? key}) : super(key: key);

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
                  FriendContainer(),
                  FriendContainer(),
                  FriendContainer(),
                ],
              ),
            )),
      ),
    );
  }
}
