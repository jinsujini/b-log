import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_application_blog/page/login/create_account.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xffFEFCEB),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            margin: const EdgeInsets.only(top: 45, bottom: 20),
            child: Image.asset("logo.png"),
          ),
          Container(
            width: 330,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(width: 0.5, color: const Color(0xff1A495D))),
            child: Column(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                        color: const Color(0xffECF6F6),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffB5DDDD))),
                    margin: const EdgeInsets.only(top: 30),
                    child: const Text('ID',
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    width: 250,
                    height: 30,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: const Color(0xffB5DDDD)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " ",
                          contentPadding: EdgeInsets.only(left: 10, top: -20)),
                    ),
                  ),
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                        color: const Color(0xffECF6F6),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffB5DDDD))),
                    margin: const EdgeInsets.only(top: 30),
                    child: const Text('Password',
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    width: 250,
                    height: 30,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: const Color(0xffB5DDDD)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " ",
                          contentPadding: EdgeInsets.only(left: 10, top: -20)),
                    ),
                  ),
                ])
              ],
            ),
          ),
          Container(
              width: 100,
              height: 50,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xffB5DDDB),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const create_account()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          const Text(
            "계정이 없으신가요?",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const create_account()));
              },
              child: const Text("회원가입",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                  )))
        ],
      ),
    ));
  }
}
