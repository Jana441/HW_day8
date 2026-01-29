import 'package:flutter/material.dart';
import 'package:hw_day8/extension/nav.dart';
import 'package:hw_day8/widget s/TextFieldWidget.dart';
import 'package:hw_day8/service/Database.dart';
import 'package:hw_day8/Screen/signUp.dart';
import 'package:hw_day8/Screen/dataScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 194, 237),
        title: Text(
          "Welcome  \n Login to your Account",
          style: TextStyle(
            fontSize: 22,
            color: const Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold, 
        
          ),
        ),
      
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 170),
        child: 
          Column(
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
                    await Database().login(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    if (context.mounted) {
                      context.pushAndClear(MyWidget());
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error ${e.toString()}")),
                    );
                  }
                },
                child: Text("Login"),
              ),
              TextButton(
                onPressed: () {
                  context.pushAndClear(SignUpScreen());
                },
                child: Text("if you don't have account sign up here!"),
              ),
            ],
          ),
     
      ),
    );
  }
}
