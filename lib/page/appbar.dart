import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class appbar extends StatelessWidget {
  const appbar({super.key});

/* appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: appbar(),
        ),
    앱바 필요한 페이지에 추가할 코드. 
    body랑 같이 home으로 묶고 나서 사용. */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFEFCEB),
        title: Image.asset(
          "logo.png",
          width: 50,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(30),
                child: Text("끝나버렸다. 난 시작도 안해봤는데."),
              ),
            ],
          )),
    );
  }
}
