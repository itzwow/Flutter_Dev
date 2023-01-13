import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/signup.dart';
import 'package:movie_app/utils/helper/sharedprefhelp.dart';
import 'package:movie_app/utils/text.dart';

import '../moviescreen.dart';
import '../widgets_ui/reusableWidgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,

          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            children: <Widget>[
              logowidget("assets/images/logo.png"),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Email Address',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              reusableTextField("Enter your email",
                  Icons.person_outline_outlined, false, _emailController),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Password',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              reusableTextField(
                  "Enter your Password", Icons.lock, true, _passwordController),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text('Forgot Password?',
                          textAlign: TextAlign.right,
                          style:
                              TextStyle(fontSize: 16, color: Colors.redAccent)),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 20,),
              reusableButton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text)
                    .then((value) async{
                  await SharedprefFunction.saveLogInStatus(true);
                  // await SharedprefFunction.saveUserEmail(_emailController.text);

                  ScaffoldMessenger.of(context).showSnackBar(alertBox(context, "Login Successful", "green"));
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => Moviescreen()), (route)=>false);
                }).onError((error, stackTrace) {
                  print("Error: ${error.toString()}");
                  ScaffoldMessenger.of(context).showSnackBar(alertBox(context, "${error.toString()}", "red"));
                });
              }),
              Signup(context),
            ],
          ),
        ),
      )),
    );
  }
}

Row Signup(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't have an account?",
          style: TextStyle(color: Colors.white54)),
      GestureDetector(
        onTap: () {
          // BuildContext ? context;

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        },
        child: Text(
          ' Sign Up',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}

