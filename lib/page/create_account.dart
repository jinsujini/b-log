import 'package:flutter/material.dart';
import 'package:flutter_application_blog/page/login.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_application_blog/page/mypage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final _formKey = GlobalKey<FormState>();

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return '이메일을 입력하세요';
  } else {
    String pattern = r'^[^@]+@[^@]+\.[^@]+$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return '잘못된 이메일 형식입니다.';
    }
  }
  return null;
}

String? validateNickName(String? value) {
  String pattern = r'[!@#$%^&*(),.?":{}|<>]';
  RegExp regExp = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return '닉네임을 입력하세요';
  } else if (regExp.hasMatch(value)) {
    return '특수문자는 닉네임에 포함할 수 없습니다.';
  }
  return null;
}

class create_account extends StatefulWidget {
  const create_account({Key? key}) : super(key: key);

  @override
  _create_accountState createState() => _create_accountState();
}

class _create_accountState extends State<create_account> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return '\n \n비밀번호를 확인하세요';
    } else if (value != _passwordController.text) {
      return '\n\n비밀번호가 일치하지 않습니다.';
    } else {
      return null;
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<http.Response> sendPostRequest() async {
    final url = Uri.parse('http://localhost:8081/user/create');

    try {
      String? imageUrl;

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "nickname": _nicknameController.text,
          "password": _passwordController.text,
          "email": _emailController.text,
          "img_url": imageUrl ?? "",
        }),
      );

      return response;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(133, 227, 254, 254),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        width: 0.5, color: Color.fromARGB(123, 61, 82, 91)),
                    image: _image != null
                        ? DecorationImage(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: _image == null
                      ? const Icon(
                          Icons.camera_alt,
                          color: Color(0xff1A495D),
                          size: 40,
                        )
                      : null,
                ),
              ),
              Container(
                width: 330,
                height: 350,
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
                            width: 100,
                            height: 22,
                            decoration: BoxDecoration(
                                color: Color(0xffECF6F6),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0xffB5DDDD))),
                            margin: EdgeInsets.only(top: 20),
                            child: Text('NickName',
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center),
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 260,
                                height: 30,
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xffB5DDDD)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(
                                width: 260,
                                height: 45,
                                child: TextFormField(
                                    controller: _nicknameController,
                                    validator: validateNickName,
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
                            width: 90,
                            height: 22,
                            decoration: BoxDecoration(
                                color: Color(0xffECF6F6),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0xffB5DDDD))),
                            margin: EdgeInsets.only(top: 10),
                            child: Text('Password',
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center),
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 260,
                                height: 30,
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xffB5DDDD)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(
                                width: 260,
                                height: 45,
                                child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(left: 10, right: 10),
                                    )),
                              ),
                            ],
                          ),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 130,
                            height: 22,
                            decoration: BoxDecoration(
                                color: Color(0xffECF6F6),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0xffB5DDDD))),
                            margin: EdgeInsets.only(top: 10),
                            child: Text('Password check',
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center),
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 260,
                                height: 30,
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xffB5DDDD)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(
                                width: 260,
                                height: 55,
                                child: TextFormField(
                                    controller: _confirmPasswordController,
                                    validator: validateConfirmPassword,
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
                            width: 80,
                            height: 22,
                            decoration: BoxDecoration(
                                color: Color(0xffECF6F6),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0xffB5DDDD))),
                            margin: EdgeInsets.only(top: 5),
                            child: Text('e-mail',
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center),
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 260,
                                height: 30,
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xffB5DDDD)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(
                                width: 260,
                                height: 45,
                                child: TextFormField(
                                    controller: _emailController,
                                    validator: validateEmail,
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final response = await sendPostRequest();

                            if (response.statusCode == 200) {
                              Navigator.of(context).pop("SignUp");
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Login();
                              }));
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                      'Failed to sign up. Please try again.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
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
