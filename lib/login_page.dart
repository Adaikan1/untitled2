import 'package:flutter/material.dart';
import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        title: const Text("Google Login"),
        backgroundColor: Color(0xFF4586F1),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(image: AssetImage("assets/LOGO.png"),
            width: 500),
            const Text("Hey There, Welcome Back!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
            GestureDetector(
              onTap: () {
                AuthService(). signInWithGoogle();
              },
                child: const Image(
                    width: 300,
                    image: AssetImage('assets/signin.png'))
            ),
          ],
        ),
      ),
    );
  }
}
