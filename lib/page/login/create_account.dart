import 'package:flutter/material.dart';

class create_account extends StatelessWidget {
  const create_account({super.key});

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
              width: 100,
              height: 80,
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: Image.asset("logo.png"),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text("create account",
                  style: TextStyle(
                      color: Color(0xffDF5E00),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xffDF5E00),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              width: 330,
              height: 480,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border:
                      Border.all(width: 0.5, color: const Color(0xff1A495D))),
              child: Column(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: const Color(0xffECF6F6),
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: const Color(0xffB5DDDD))),
                          margin: const EdgeInsets.only(top: 20),
                          child: const Text('ID',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          width: 260,
                          height: 30,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: const Color(0xffB5DDDD)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: " ",
                                contentPadding:
                                    EdgeInsets.only(left: 10, top: -20)),
                          ),
                        ),
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                          height: 30,
                          decoration: BoxDecoration(
                              color: const Color(0xffECF6F6),
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: const Color(0xffB5DDDD))),
                          margin: const EdgeInsets.only(top: 20),
                          child: const Text('Password',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          width: 260,
                          height: 30,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: const Color(0xffB5DDDD)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: " ",
                                contentPadding:
                                    EdgeInsets.only(left: 10, top: -20)),
                          ),
                        ),
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 180,
                          height: 30,
                          decoration: BoxDecoration(
                              color: const Color(0xffECF6F6),
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: const Color(0xffB5DDDD))),
                          margin: const EdgeInsets.only(top: 20),
                          child: const Text('Password- check',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          width: 260,
                          height: 30,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: const Color(0xffB5DDDD)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: " ",
                                contentPadding:
                                    EdgeInsets.only(left: 10, top: -20)),
                          ),
                        ),
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              color: const Color(0xffECF6F6),
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: const Color(0xffB5DDDD))),
                          margin: const EdgeInsets.only(top: 20),
                          child: const Text('e-mail',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          width: 260,
                          height: 30,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: const Color(0xffB5DDDD)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: " ",
                                contentPadding:
                                    EdgeInsets.only(left: 10, top: -20)),
                          ),
                        ),
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                          height: 30,
                          decoration: BoxDecoration(
                              color: const Color(0xffECF6F6),
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: const Color(0xffB5DDDD))),
                          margin: const EdgeInsets.only(top: 20),
                          child: const Text('NickName',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          width: 260,
                          height: 30,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: const Color(0xffB5DDDD)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: " ",
                                contentPadding:
                                    EdgeInsets.only(left: 10, top: -20)),
                          ),
                        ),
                      ]),
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
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
