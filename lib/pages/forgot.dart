import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onlinemovieticket/pages/login_screen.dart';

import '../utils/mytheme.dart';

class Forgotpass extends StatefulWidget {
  const Forgotpass({Key? key}) : super(key: key);

  @override
  _ForgotpassState createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  // bool showProgress = false;
  bool visible = false;
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: MyTheme.splash,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          height: _size.height,
          width: _size.width,
          child: Form(
            key : _formkey,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/splash_icon.svg"),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "Welcome Buddies,",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Change Your Password !!!",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.all(19),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: _size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Change your Password",
                        style: TextStyle(
                          fontSize: 16,
                          color: MyTheme.splash,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: emailController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Email",
                            hintStyle: const TextStyle(color: Colors.black45),
                            fillColor: MyTheme.greyColor,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            visible = true;
                          });
                          Forgotpassword(
                              emailController.text);
                          //userLogin();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: MyTheme.splash,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "Change Password",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Login??",
                        style: const TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w700,color: Colors.white),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void Forgotpassword(String email) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((uid) => {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()))
      })
          .catchError((e) {
            print(e);
      });
    }
  }
}

