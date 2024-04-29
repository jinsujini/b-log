import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  bool isSearchBarVisible = false;

  List<String> list = ["sbukkki", "seoyeon"];
  List<String> filteredList = [];
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
            // 페이지 제목..필요한가..?
            Container(
              width: double.infinity,
              height: 30,
              margin: EdgeInsets.only(left: 35, top: 130),
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
                    top: 20,
                    left: 30,
                    right: 30,
                    bottom: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 26, 73, 93),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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
                              topRight: Radius.circular(15)),
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
                                    width: 360, height: 32),
                                elevation: MaterialStateProperty.all(0),
                                hintText: '친구를 찾아보세요',
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    filteredList = list
                                        .where((element) =>
                                            (element.toLowerCase().contains(
                                                value.toLowerCase())) &&
                                            (value.isNotEmpty))
                                        .toList();
                                  });
                                  print(filteredList.length);
                                },
                                trailing: [
                                  IconButton(
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
                                  thickness: 1.0),
                            ),
                            Container(
                              child: filteredList.isEmpty &&
                                      textcontroller.text.isNotEmpty
                                  ? const Text('검색 결과가 없습니다')
                                  : Expanded(
                                      child: ListView.builder(
                                        itemCount: filteredList.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(filteredList[index]),
                                          );
                                        },
                                      ),
                                    ),
                            )
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
