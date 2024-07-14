import 'package:flutter/material.dart';

import 'package:maldive_application/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  getInstance() {}
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Future<void> login() async {
    bool loggedIn = await AuthService.login(_email.text, _password.text);
    if (loggedIn) {
      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        children: [
          Text('โปรดเข้าสู่ระบบ'),
          TextFormField(
            controller: _email,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextFormField(
              controller: _password,
              decoration: const InputDecoration(
                labelText: 'Password',
              )),
          ElevatedButton(
            onPressed: login,
            child: const Text('เข้าสู่ระบบ'),
          ),
        ],
      ),
    );
  }
}
