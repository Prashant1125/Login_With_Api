import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  // login function
  void login(String email, pwd) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': pwd,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print('Login Successfully');
      } else {
        print('Something went wrong');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 167, 198, 224),
        title: const Text('Sign Up Post Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: pwdController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                login(emailController.text.toString(),
                    pwdController.text.toString());
              },
              child: Container(
                  height: mq.height * .06,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(child: Text('Login'))),
            )
          ],
        ),
      ),
    );
  }
}