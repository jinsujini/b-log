import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_blog/page/mypage.dart';

final _formKey = GlobalKey<FormState>();

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return '\n\n이메일을 입력하세요';
  } else {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return '\n\n잘못된 이메일 형식입니다.';
    } else {
      return null;
    }
  }
}

String? validatePassword(String? value) {
  String pattern =
      r'^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,15}$';
  RegExp regExp = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return '\n \n비밀번호를 입력하세요';
  } else if (value.length < 8) {
    return '\n\n비밀번호는 8자리 이상이어야 합니다';
  } else if (!regExp.hasMatch(value)) {
    return '\n\n특수문자, 문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.';
  } else {
    return null;
  }
}

String? validateNickName(String? value) {
  String pattern = r'[!@#$%^&*(),.?":{}|<>]';
  RegExp regExp = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return '\n\n닉네임을 입력하세요';
  } else if (regExp.hasMatch(value)) {
    return '\n\n특수문자는 닉네임에 포함할 수 없습니다.';
  } else {
    return null;
  }
}

class create_account extends StatelessWidget {
  const create_account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          color: Color(0xffFEFCEB),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 80,
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: Image.asset("logo.png"),
              ),
              Container(
                width: 300,
                margin: EdgeInsets.only(bottom: 10),
                child: Text("create account",
                    style: TextStyle(
                        color: Color(0xffDF5E00),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xffDF5E00),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                width: 330,
                height: 530,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(width: 0.5, color: Color(0xff1A495D))),
                child: Column(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0xffECF6F6),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xffB5DDDD))),
                            margin: EdgeInsets.only(top: 20),
                            child: Text('ID',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center),
                          ),
                          Stack(children: [
                            Container(
                              width: 260,
                              height: 30,
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Color(0xffB5DDDD)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              width: 260,
                              height: 65,
                              child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "\n\n 문자를 입력하세요.";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      helperText: " ",
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(left: 10))),
                            ),
                          ])
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0xffECF6F6),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xffB5DDDD))),
                            margin: EdgeInsets.only(top: 10),
                            child: Text('Password',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center),
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 260,
                                height: 30,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffB5DDDD)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(
                                width: 260,
                                height: 65,
                                child: TextFormField(
                                    validator: validatePassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10),
                                    )),
                              ),
                            ],
                          ),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 260,
                                height: 30,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffB5DDDD)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(
                                width: 260,
                                height: 65,
                                child: TextFormField(
                                    validator: validatePassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10),
                                    )),
                              ),
                            ],
                          ),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0xffECF6F6),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xffB5DDDD))),
                            margin: EdgeInsets.only(top: 10),
                            child: Text('e-mail',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center),
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 260,
                                height: 30,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffB5DDDD)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(
                                width: 260,
                                height: 65,
                                child: TextFormField(
                                    validator: validateEmail,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10),
                                    )),
                              ),
                            ],
                          ),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0xffECF6F6),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xffB5DDDD))),
                            margin: EdgeInsets.only(top: 20),
                            child: Text('NickName',
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center),
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 260,
                                height: 30,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Color(0xffB5DDDD)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(
                                width: 260,
                                height: 65,
                                child: TextFormField(
                                    validator: validateNickName,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10),
                                    )),
                              ),
                            ],
                          ),
                        ]),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyPage()));
                  },
                  child: Container(
                      width: 100,
                      height: 50,
                      margin: const EdgeInsets.only(top: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xffB5DDDD),
                      ),
                      child: TextButton(
                        child: const Text(
                          'SignUp',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pop("SignUp");
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return MyPage();
                            }));
                          }
                        },
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
