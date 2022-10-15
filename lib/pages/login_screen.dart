import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onlinemovieticket/admin/admin_home.dart';
import 'package:onlinemovieticket/screens/home.dart';
import '../pages/signup_screen.dart';
import '../utils/mytheme.dart';
import '../utils/social_buttons.dart';
import 'package:onlinemovieticket/ipconfig.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'forgot.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;


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
                "Login to book your seat, your seat !!!",
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
                      "Login to your account",
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

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          }
                          if (!regex.hasMatch(value)) {
                            return ("please enter valid password min. 6 character");
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          passwordController.text = value!;
                        },
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: TextButton(
                    //     onPressed: () {
                    //       Get.defaultDialog(
                    //         title: "Forgort Password Or Username?",
                    //         content: TextFormField(
                    //           style: const TextStyle(color: Colors.black),
                    //           controller: forgotController,
                    //           decoration: InputDecoration(
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(5),
                    //               borderSide: BorderSide.none,
                    //             ),
                    //             hintText: "Write Your Recovery Text",
                    //             hintStyle: const TextStyle(color: Colors.black45),
                    //             fillColor: MyTheme.greyColor,
                    //             filled: true,
                    //           ),
                    //         ),
                    //
                    //         radius: 10,
                    //         onWillPop: () {
                    //           forgotController.text = "";
                    //
                    //           return Future.value(true);
                    //         },
                    //         contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    //         confirm: ElevatedButton(
                    //           onPressed: () {
                    //             // AuthController.instance.forgorPassword(forgotEmailController.text.trim());
                    //             passwordrecovery();
                    //             Get.back();
                    //           },
                    //           style: ElevatedButton.styleFrom(
                    //             primary: MyTheme.splash,
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(5),
                    //             ),
                    //           ),
                    //           child: const Center(
                    //             child: Padding(
                    //               padding: EdgeInsets.all(12),
                    //               child: Text(
                    //                 "Check",
                    //                 style: TextStyle(fontSize: 16),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //     child: const Text(
                    //       "Forgot Password?",
                    //       style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
                    //     ),
                    //   ),
                    // ),


                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          visible = true;
                        });
                        signIn(
                            emailController.text, passwordController.text);
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
                            "LOGIN",
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
                      text: "Forgot Password??",
                      style: const TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w700,color: Colors.white),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Forgotpass()));
                        },
                    ),
                  ],
                ),
              ),

              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Don’t have an account ? ",
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),
                    ),
                    TextSpan(
                      text: "Sign up",
                      style: const TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w700,color: Colors.white),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
                          Get.to(const SignUpScreen());
                        },
                    ),
                    const TextSpan(
                      text: " here.",
                      style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),
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

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if(email == "vatsalextra0@gmail.com")
          {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => admin_home(),
              ),
            );
          }
        else
          {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          }

      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}

//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:onlinemovieticket/pages/signup_screen.dart';
// import 'package:onlinemovieticket/screens/home.dart';
//
// import 'forgot.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   bool _isObscure3 = true;
//   bool visible = false;
//   final _formkey = GlobalKey<FormState>();
//   final TextEditingController emailController = new TextEditingController();
//   final TextEditingController passwordController = new TextEditingController();
//
//   final _auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(
//               color: Colors.blue[900],
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.70,
//               child: Center(
//                 child: Container(
//                   margin: EdgeInsets.all(12),
//                   child: Form(
//                     key: _formkey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Text(
//                           "Login",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontSize: 40,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         TextFormField(
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.white,
//                             hintText: 'Email',
//                             enabled: true,
//                             contentPadding: const EdgeInsets.only(
//                                 left: 14.0, bottom: 8.0, top: 8.0),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: new BorderSide(color: Colors.white),
//                               borderRadius: new BorderRadius.circular(10),
//                             ),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: new BorderSide(color: Colors.white),
//                               borderRadius: new BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value!.length == 0) {
//                               return "Email cannot be empty";
//                             }
//                             if (!RegExp(
//                                 "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                                 .hasMatch(value)) {
//                               return ("Please enter a valid email");
//                             } else {
//                               return null;
//                             }
//                           },
//                           onSaved: (value) {
//                             emailController.text = value!;
//                           },
//                           keyboardType: TextInputType.emailAddress,
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         TextFormField(
//                           controller: passwordController,
//                           obscureText: _isObscure3,
//                           decoration: InputDecoration(
//                             suffixIcon: IconButton(
//                                 icon: Icon(_isObscure3
//                                     ? Icons.visibility
//                                     : Icons.visibility_off),
//                                 onPressed: () {
//                                   setState(() {
//                                     _isObscure3 = !_isObscure3;
//                                   });
//                                 }),
//                             filled: true,
//                             fillColor: Colors.white,
//                             hintText: 'Password',
//                             enabled: true,
//                             contentPadding: const EdgeInsets.only(
//                                 left: 14.0, bottom: 8.0, top: 15.0),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: new BorderSide(color: Colors.white),
//                               borderRadius: new BorderRadius.circular(10),
//                             ),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide: new BorderSide(color: Colors.white),
//                               borderRadius: new BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             RegExp regex = new RegExp(r'^.{6,}$');
//                             if (value!.isEmpty) {
//                               return "Password cannot be empty";
//                             }
//                             if (!regex.hasMatch(value)) {
//                               return ("please enter valid password min. 6 character");
//                             } else {
//                               return null;
//                             }
//                           },
//                           onSaved: (value) {
//                             passwordController.text = value!;
//                           },
//                           keyboardType: TextInputType.emailAddress,
//                         ),
//                         RaisedButton(
//                           color: Colors.blue[900],
//                           textColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             // side: BorderSide(color: Colors.black, width: 1),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).pushReplacement(
//                                 MaterialPageRoute(
//                                     builder: (context) => Forgotpass()));
//                           },
//                           child: Text(
//                             "Forgot Password ....",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         MaterialButton(
//                           shape: RoundedRectangleBorder(
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(20.0))),
//                           elevation: 5.0,
//                           height: 40,
//                           onPressed: () {
//                             setState(() {
//                               visible = true;
//                             });
//                             signIn(
//                                 emailController.text, passwordController.text);
//                           },
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           color: Colors.white,
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Visibility(
//                             maintainSize: true,
//                             maintainAnimation: true,
//                             maintainState: true,
//                             visible: visible,
//                             child: Container(
//                                 child: CircularProgressIndicator(
//                                   color: Colors.white,
//                                 ))),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               color: Colors.white,
//               width: MediaQuery.of(context).size.width,
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     MaterialButton(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(20.0),
//                         ),
//                       ),
//                       elevation: 5.0,
//                       height: 40,
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Register(),
//                           ),
//                         );
//                       },
//                       color: Colors.blue[900],
//                       child: Text(
//                         "Register Now",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Text(
//                       "Made by",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 40,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "WEBFUN",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30,
//                         color: Colors.yellowAccent[400],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void signIn(String email, String password) async {
//     if (_formkey.currentState!.validate()) {
//       try {
//         UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomeScreen(),
//           ),
//         );
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found') {
//           print('No user found for that email.');
//         } else if (e.code == 'wrong-password') {
//           print('Wrong password provided for that user.');
//         }
//       }
//     }
//   }
// }