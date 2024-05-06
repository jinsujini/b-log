import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_blog/page/friendBoolLog.dart';

import 'package:flutter_application_blog/page/friendBookLog.dart';

class Friend {
  final String name;
  final String profileImageUrl;
  final String introduction;

  Friend({
    required this.name,
    required this.profileImageUrl,
    required this.introduction,
  });
}

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  bool isSearchBarVisible = false;

  List<Friend> friendsList = [
    Friend(name: 'sbukkki', profileImageUrl: 'url_here', introduction: '자게 해줘'),
    Friend(
        name: 'seoyeon', profileImageUrl: 'url_here', introduction: '아님 나를 죽여'),
    // 다른 친구들도 추가, db에서 받아올거
  ];
  List<Friend> filteredList = [];
  var textcontroller = TextEditingController();

  void toggleSearchBarVisibility() {
    setState(() {
      isSearchBarVisible = !isSearchBarVisible;
    });
  }

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
                "친구 게시물",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 129, 129, 129),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  // 친구 게시물..위치는 추후 수정
                  Positioned(
                    top: 10,
                    left: 30,
                    right: 30,
                    bottom: 120,
                    child: FriendBookLog(),
                  ),
                  // 하단 친구 검색바
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    top: isSearchBarVisible ? 0 : 633,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        toggleSearchBarVisibility();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(232, 242, 242, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 26, 73, 93),
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SearchBar(
                                controller: textcontroller,
                                constraints: BoxConstraints.expand(
                                  width: 360,
                                  height: 32,
                                ),

                                elevation: WidgetStateProperty.all(0),

                                elevation: MaterialStateProperty.all(0),

                                hintText: '친구를 찾아보세요',
                                onChanged: (value) {
                                  setState(() {
                                    filteredList = friendsList.where((friend) {
                                      final name = friend.name.toLowerCase();
                                      return name
                                              .contains(value.toLowerCase()) &&
                                          value.isNotEmpty;
                                    }).toList();
                                  });
                                },
                                trailing: [
                                  IconButton(
                                    color: Color.fromARGB(255, 26, 73, 93),
                                    icon: const Icon(Icons.search_outlined),
                                    onPressed: () {
                                      print('친구찾기');
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 400,
                              margin: EdgeInsets.only(top: 18),
                              child: Divider(
                                color: Color.fromRGBO(26, 73, 93, 1),
                                thickness: 1.0,
                              ),
                            ),
                            Container(
                              child: filteredList.isEmpty &&
                                      textcontroller.text.isNotEmpty
                                  ? const Text('검색 결과가 없습니다')
                                  : Expanded(
                                      child: ListView.builder(
                                        itemCount: filteredList.length,
                                        itemBuilder: (context, index) {
                                          final friend = filteredList[index];
                                          return ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  friend.profileImageUrl),
                                            ),
                                            title: Text(friend.name),
                                            subtitle: Text(friend.introduction),
                                          );
                                        },
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
