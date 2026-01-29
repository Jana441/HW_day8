import 'package:flutter/material.dart';
import 'package:hw_day8/Screen/dataScreen.dart';
import 'package:hw_day8/extension/nav.dart';
import 'package:hw_day8/Screen/login.dart';
import 'package:hw_day8/service/Database.dart';
import 'package:hw_day8/widget s/TextFieldWidget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 194, 237),
        title: Text(
          "SignUp",
          style: TextStyle(fontSize: 24, color: const Color.fromARGB(255, 27, 27, 27) , fontWeight: FontWeight.bold),
        ),
       
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 170),
        child: Column(
          children: [
            TextFieldWidget(
              hint: "Enter you email",
              icon: Icon(Icons.email),
              controller: emailController,
            ),
            SizedBox(height: 24),
            TextFieldWidget(
              hint: "Enter you password",
              icon: Icon(Icons.password),
              controller: passwordController,
               isPass: true
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                try {
                  await Database().signUp(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (context.mounted) {
                    context.pushAndClear(MyWidget());
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content : Text(("Error : ${e.toString()}"))),
                  );
                }
              },
              child: Text("Sign up"),
            ),
            TextButton(
              onPressed: () {
                context.pushAndClear(LoginScreen());
              },
              child: Text("login"),
            ),
          ],
        ),
      ),
    );
  }
}
