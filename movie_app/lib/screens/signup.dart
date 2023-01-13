import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/moviescreen.dart';
import 'package:movie_app/screens/login.dart';
import '../utils/helper/sharedprefhelp.dart';
import '../widgets_ui/reusableWidgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
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
              SizedBox(
                height: 40,
              ),
              reusableButton(context, false, () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text)
                    .then((value) async {
                  // print("Account Created Successfully!");
                  await SharedprefFunction.saveLogInStatus(true);
                  // await SharedprefFunction.saveUserEmail(_emailController.text);

                  ScaffoldMessenger.of(context).showSnackBar(alertBox(
                      context, "Account Created Successfully!", "green"));
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => Moviescreen()), (route)=>false);
                }).onError((error, stackTrace) {
                  // print("Error: ${error.toString()}");
                  ScaffoldMessenger.of(context).showSnackBar(
                      alertBox(context, "${error.toString()}", "red"));
                  // alertBox(context);
                });
              }),
            ],
          ),
        ),
      )),
    );
  }
}
