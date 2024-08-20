import 'package:flutter/material.dart';
import 'package:flutter_application_blog/page/mainPage.dart';
import 'package:flutter_application_blog/page/mypage.dart';
import 'package:flutter_application_blog/page/create_account.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  static final storage = FlutterSecureStorage();
  final Dio _dio = Dio();
  final CookieJar _cookieJar = CookieJar();
  late final CookieManager _cookieManager;

  @override
  void initState() {
    super.initState();
    _cookieManager = CookieManager(_cookieJar);
    _dio.interceptors.add(_cookieManager);
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final userInfo = await storage.read(key: 'sessionToken');
    if (userInfo != null) {
      // Handle user already logged in case
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                const MainPage()), // Redirect to the main page
      );
    }
  }

  Future<bool> loginAction(String nickname, String password) async {
    try {
      _dio.options = BaseOptions(
        baseUrl: "http://10.0.2.2:8081",
        headers: {"Accept": "application/json"},
      );

      var param = {'nickname': nickname, 'password': password};
      Response response = await _dio.post('/user/login', data: param);

      if (response.statusCode == 200) {
        final sessionToken = response.data['sessionToken'];
        await storage.write(key: 'sessionToken', value: sessionToken);
        print('Login successful!');
        return true;
      } else {
        print('Login failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: const Color(0xffFEFCEB),
      child: SingleChildScrollView(
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
                border: Border.all(width: 0.5, color: const Color(0xff1A495D)),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField(
                      controller: _nicknameController,
                      label: 'Nickname',
                    ),
                    _buildTextField(
                      controller: _passwordController,
                      label: 'Password',
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildLoginButton(),
            const SizedBox(height: 10),
            _buildSignUpPrompt(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: 100,
      height: 50,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color(0xffB5DDDB),
      ),
      child: Center(
        child: GestureDetector(
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              bool success = await loginAction(
                  _nicknameController.text, _passwordController.text);
              if (success) {
                print('로그인 성공');
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) =>
                          const MainPage()), // Redirect to the main page
                );
              } else {
                print('로그인 실패');
              }
            }
          },
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpPrompt() {
    return Column(
      children: [
        const Text(
          "계정이 없으신가요?",
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const create_account()),
            );
          },
          child: const Text(
            "회원가입",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 22),
            textAlign: TextAlign.left,
          ),
          Container(
            width: 250,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: const Color(0xffB5DDDD)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: " ",
                contentPadding: const EdgeInsets.only(left: 10, top: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
